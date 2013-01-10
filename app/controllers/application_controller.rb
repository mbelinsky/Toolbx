class ApplicationController < ActionController::Base
  protect_from_forgery
  force_ssl

  before_filter :identify_known_bots, :identify_browser_and_os

  private

  def current_user
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end
  helper_method :current_user

  def authorize
    redirect_to login_url, alert: "Uh oh, you'll have to log in before doing that." if current_user.nil?
  end

  def identify_known_bots
    @known_bot = false

    # This happens sometimes. Just dump them.
    if request.user_agent.blank?
      @known_bot = true and return
    end

    # Blacklist, catch anything with "bot" or "spider" in its name
    known_bots = ['bot', 'spider', 'slurp', 'bingweb', 'montastic', 'java', 'covario', 'page2rss', 'aboundex',
                  'urldbcleaner', 'ruby', 'crawler', 'wordpress', 'newrelic', 'feedfetcher', 'appengine',
                  'apachebench', 'siege', 'facebookexternalhit', 'mfp', 'googlehttpclient', 'wget',
                  'python-urllib', 'metauri', 'eventmachine', 'hatena', 'unwindfetcher', 'safeeyes', 'libwww-perl',
                  'js-kit', 'postrank', 'htmlparser', 'curl', 'cjnetworkquality', 'php', 'pycurl']

    known_bots.each { |b| @known_bot = true and break if request.user_agent.downcase[b] }
  end

  def identify_browser_and_os
    @browser = @os = nil

    unless @known_bot
      browser_mapping = { 'MSIE 10'       => 'ie10 ie',
                          'MSIE 9'        => 'ie9 ie lt-ie10',
                          'MSIE 8'        => 'ie8 ie lt-ie10 lt-ie9',
                          'MSIE 7'        => 'ie7 ie lt-ie10 lt-ie9 lt-ie8',
                          'MSIE 6'        => 'ie6 ie lt-ie10 lt-ie9 lt-ie8 lt-ie7',
                          'Firefox'       => 'ff',
                          'Chrome'        => 'chrome',
                          'Epiphany'      => 'epiphany',
                          'Safari'        => 'safari',
                          'Opera'         => 'opera',
                          'Seamonkey'     => 'seamonkey',
                          'Samsung'       => 'samsung',
                          'LG'            => 'lg',
                          'DoCoMo'        => 'docomo',
                          'Nokia'         => 'nokia' }

      os_mapping = {  'Windows'   => 'windows',
                      'Macintosh' => 'osx',
                      'iPhone'    => 'iphone',
                      'iPad'      => 'ipad',
                      'Android'   => 'android',
                      'Linux'     => 'linux',
                      'Fedora'    => 'linux',
                      'Samsung'   => 'samsung',
                      'LG'        => 'lg',
                      'DoCoMo'    => 'docomo',
                      'Nokia'     => 'nokia'  }

      browser_mapping.each  { |k, v| @browser = v and break if request.user_agent[k] }
      os_mapping.each       { |k, v| @os = v      and break if request.user_agent[k] }
    end
  end
end
