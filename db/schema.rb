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

ActiveRecord::Schema.define(:version => 20120627202210) do

  create_table "categories", :force => true do |t|
    t.string   "icon_url"
    t.string   "name"
    t.string   "plural_name"
    t.string   "short_name"
    t.string   "foursquare_id"
    t.boolean  "primary"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "parent"
  end

  create_table "escapes", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "venue"
    t.string   "details"
    t.string   "price"
    t.string   "phone"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "expiration"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "latitude"
    t.string   "longitude"
  end

  create_table "flickr_photos", :force => true do |t|
    t.integer  "escape_id"
    t.string   "url_med"
    t.string   "flickr_id"
    t.string   "title"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "current_state"
  end

  create_table "foursquare_spots", :force => true do |t|
    t.integer  "escape_id"
    t.string   "foursquare_id"
    t.string   "name"
    t.string   "latitude"
    t.string   "longitude"
    t.integer  "checkins"
    t.integer  "tips"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "url"
  end

  create_table "venue_categories", :force => true do |t|
    t.integer  "category_id"
    t.integer  "foursquare_spot_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

end
