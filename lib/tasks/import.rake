task import: :environment do
  require 'csv'
  liddy = License.find_by_name('Closed').id

  #name,site_url_2,icon_url_3,platform_names,google_play_url,app_store_url,screen_urls,Description,category_names,price,language_names,icon_url_2,facebook_username_2,twitter_username_2,site_url_1,icon_url_1,facebook_username_1,twitter_username_1
  CSV.foreach("#{Rails.root}/import.csv", headers: true, header_converters: :symbol) do |row|
    if Tool.find_by_name(row[:name])
      puts "!!! #{row[:name]} already exists"
      next
    end

    screen_urls = row[:screen_urls].split(', ').reject(&:empty?).reject {|url| url == ' '}.uniq

    platform_names = row[:platform_names].split(', ').reject(&:empty?).uniq
    category_names = row[:category_names].split(', ').reject(&:empty?).uniq
    platform_ids = platform_names.map {|n| Platform.find_by_name!(n).id}
    category_ids = category_names.map {|n| Category.find_by_title!(n).id}


    tool_screens = screen_urls.each_with_index.map do |url, i|
      scr = Screen.new(order: i)
      scr.screenshot_remote_url = url
      scr
    end

    tool = Tool.new(
      category_ids: category_ids,
      platform_ids: platform_ids,
      license_id: liddy,

      name: row[:name],
      cost: row[:price],
      description: row[:description] || '',
      google_play_url: row[:google_play_url],
      app_store_url: row[:app_store_url],
      site_url: (row[:site_url_1] && !row[:site_url_1].strip.empty? && row[:site_url_1]) || (row[:site_url_2] && !row[:site_url_2].strip.empty? && row[:site_url_2]),
      facebook_username: (row[:facebook_username_1] && !row[:facebook_username_1].strip.empty? && row[:facebook_username_1]) || (row[:facebook_username_2] && !row[:facebook_username_2].strip.empty? && row[:facebook_username_2]),
      twitter_username: (row[:twitter_username_1] && !row[:twitter_username_1].strip.empty? && row[:twitter_username_1]) || (row[:twitter_username_2] && !row[:twitter_username_2].strip.empty? && row[:twitter_username_2]),

      screens: tool_screens
    )

    icon_remote_url = nil
    if row[:icon_url_1] && !row[:icon_url_1].strip.empty?
      icon_remote_url = row[:icon_url_1].strip
    elsif row[:icon_url_2] && !row[:icon_url_2].strip.empty?
      icon_remote_url = row[:icon_url_2].strip
    elsif row[:icon_url_3] && !row[:icon_url_3].strip.empty?
      icon_remote_url = row[:icon_url_3].strip
    end

    if icon_remote_url.nil?
      puts "!!! NO ICON FOR #{tool.name}"
      next
    end

    tool.icon_remote_url = icon_remote_url

    if tool.save
      puts "#{tool.name} successfully imported! ^_^"
    else
      puts '----------------------------------'
      puts 'TOOL FAILED TO IMPORT:'
      puts tool.inspect
      puts tool.errors.inspect
      puts '----------------------------------'
    end
  end
end