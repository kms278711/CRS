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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_09_12_052230) do

  create_table "rent_posts", force: :cascade do |t|
    t.string "lens_name"
    t.string "lens_img"
    t.string "mount"
    t.string "zoom_lens"
    t.integer "distance"
    t.integer "aperture"
    t.boolean "is"
    t.string "location"
    t.integer "price"
    t.boolean "rented"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
