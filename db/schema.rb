# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130124194629) do

  create_table "article_categories", :force => true do |t|
    t.integer  "article_id"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "article_categories", ["article_id"], :name => "index_article_categories_on_article_id"
  add_index "article_categories", ["category_id"], :name => "index_article_categories_on_category_id"

  create_table "article_images", :force => true do |t|
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "article_tools", :force => true do |t|
    t.integer  "article_id"
    t.integer  "tool_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "article_tools", ["article_id"], :name => "index_article_tools_on_article_id"
  add_index "article_tools", ["tool_id"], :name => "index_article_tools_on_tool_id"

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.integer  "author_id"
    t.text     "body"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.boolean  "featured",                    :default => false
    t.integer  "users_count",                 :default => 0
    t.boolean  "published",                   :default => false
    t.string   "featured_image_file_name"
    t.string   "featured_image_content_type"
    t.integer  "featured_image_file_size"
    t.datetime "featured_image_updated_at"
  end

  add_index "articles", ["author_id"], :name => "index_articles_on_author_id"

  create_table "categories", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "cities", :force => true do |t|
    t.string  "name",       :limit => 70
    t.string  "short_name", :limit => 60
    t.integer "region_id",  :limit => 2
    t.integer "country_id", :limit => 2
  end

  create_table "continents", :force => true do |t|
    t.string "name", :limit => 25
  end

  create_table "countries", :force => true do |t|
    t.string  "name",         :limit => 40
    t.string  "short_name",   :limit => 30
    t.integer "continent_id", :limit => 1
    t.integer "dial_code",    :limit => 2
  end

  create_table "languages", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "licenses", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "platforms", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "regions", :force => true do |t|
    t.string  "name",       :limit => 35
    t.string  "short_name", :limit => 25
    t.integer "country_id", :limit => 2
  end

  create_table "screens", :force => true do |t|
    t.integer  "tool_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "screenshot_file_name"
    t.string   "screenshot_content_type"
    t.integer  "screenshot_file_size"
    t.datetime "screenshot_updated_at"
    t.integer  "order"
  end

  create_table "tool_categories", :force => true do |t|
    t.integer  "tool_id"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "tool_categories", ["category_id"], :name => "index_tool_categories_on_category_id"
  add_index "tool_categories", ["tool_id"], :name => "index_tool_categories_on_tool_id"

  create_table "tool_platforms", :force => true do |t|
    t.integer  "tool_id"
    t.integer  "platform_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "tool_platforms", ["platform_id"], :name => "index_tool_platforms_on_platform_id"
  add_index "tool_platforms", ["tool_id"], :name => "index_tool_platforms_on_tool_id"

  create_table "tools", :force => true do |t|
    t.string   "name"
    t.decimal  "cost",              :precision => 6, :scale => 2
    t.text     "description"
    t.string   "github_url"
    t.string   "google_play_url"
    t.string   "app_store_url"
    t.string   "site_url"
    t.boolean  "featured",                                        :default => false
    t.integer  "license_id"
    t.datetime "created_at",                                                         :null => false
    t.datetime "updated_at",                                                         :null => false
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.integer  "users_count",                                     :default => 0
  end

  add_index "tools", ["license_id"], :name => "index_tools_on_license_id"

  create_table "user_articles", :force => true do |t|
    t.integer  "user_id"
    t.integer  "article_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_articles", ["article_id"], :name => "index_user_articles_on_article_id"
  add_index "user_articles", ["user_id"], :name => "index_user_articles_on_user_id"

  create_table "user_categories", :force => true do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "user_categories", ["category_id"], :name => "index_user_categories_on_category_id"
  add_index "user_categories", ["user_id"], :name => "index_user_categories_on_user_id"

  create_table "user_languages", :force => true do |t|
    t.integer  "user_id"
    t.integer  "language_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "user_languages", ["language_id"], :name => "index_user_languages_on_language_id"
  add_index "user_languages", ["user_id"], :name => "index_user_languages_on_user_id"

  create_table "user_tools", :force => true do |t|
    t.integer  "user_id"
    t.integer  "tool_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_tools", ["tool_id"], :name => "index_user_tools_on_tool_id"
  add_index "user_tools", ["user_id"], :name => "index_user_tools_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "facebook_username"
    t.string   "twitter_username"
    t.string   "linkedin_username"
    t.string   "website_url"
    t.text     "description"
    t.integer  "city_id"
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
    t.string   "profile_picture_file_name"
    t.string   "profile_picture_content_type"
    t.integer  "profile_picture_file_size"
    t.datetime "profile_picture_updated_at"
    t.string   "toolbox_auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.datetime "last_login"
    t.boolean  "admin",                        :default => false
    t.string   "username"
    t.integer  "tools_count",                  :default => 0
    t.integer  "articles_count",               :default => 0
    t.string   "google_plus_id"
  end

  add_index "users", ["city_id"], :name => "index_users_on_city_id"

end
