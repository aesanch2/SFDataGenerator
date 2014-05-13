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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140513185338) do

  create_table "contact", force: true do |t|
    t.string  "sfdc_id"
    t.string  "FirstName"
    t.string  "LastName"
    t.string  "MailingStreet"
    t.string  "MailingCity"
    t.string  "MailingState"
    t.string  "MailingPostalCode"
    t.string  "MailingCountry"
    t.integer "Phone"
    t.integer "Fax"
    t.string  "Email"
    t.date    "Birthdate"
    t.string  "Gender"
    t.decimal "GPAUnder",          precision: 3, scale: 2
    t.decimal "GPAJrSr",           precision: 3, scale: 2
  end

  create_table "contacts", force: true do |t|
    t.string  "sfdc_id"
    t.string  "FirstName"
    t.string  "LastName"
    t.string  "MailingStreet"
    t.string  "MailingCity"
    t.string  "MailingState"
    t.string  "MailingPostalCode"
    t.string  "MailingCountry"
    t.integer "Phone"
    t.integer "Fax"
    t.string  "Email"
    t.date    "Birthdate"
    t.string  "Gender"
    t.decimal "GPAUnder",          precision: 3, scale: 2
    t.decimal "GPAJrSr",           precision: 3, scale: 2
  end

end
