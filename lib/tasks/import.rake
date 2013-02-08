task import: :environment do
  require 'csv'

  CSV.foreach('./fmlimport.csv', headers: true, header_converters: :symbol) do |row|
    screen_urls = row[:screen_urls].split(', ').reject(&:empty?).uniq

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
      license_id: row[:license_id] || License.find_by_name('Closed').id,

      name: row[:name],
      cost: row[:price],
      description: row[:description],
      github_url: row[:github_url],
      google_play_url: row[:google_play_url],
      app_store_url: row[:app_store_url],
      site_url: row[:site_url],
      facebook_username: row[:facebook_username],
      twitter_username: row[:twitter_username],

      screens: tool_screens
    )

    tool.icon_remote_url = row[:icon_url]

    if tool.save
      puts "#{tool.name} successfully imported! ^_^"
      puts '---------'
    else
      puts 'TOOL FAILED TO IMPORT:'
      puts tool.inspect
      puts tool.errors.inspect
      puts '----------------------------------'
    end
  end
end