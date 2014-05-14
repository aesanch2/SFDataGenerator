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

ActiveRecord::Schema.define(version: 20140514202902) do

  create_table "contacts", force: true do |t|
    t.string  "sfdc_id"
    t.string  "FirstName"
    t.string  "LastName"
    t.string  "Salutation"
    t.string  "RoverStatus"
    t.string  "OtherStreet"
    t.string  "OtherCity"
    t.string  "OtherState"
    t.string  "OtherPostalCode"
    t.string  "OtherCountry"
    t.string  "MailingStreet"
    t.string  "MailingCity"
    t.string  "MailingState"
    t.string  "MailingPostalCode"
    t.string  "MailingCountry"
    t.integer "Phone"
    t.integer "Fax"
    t.integer "MobilePhone"
    t.integer "HomePhone"
    t.integer "OtherPhone"
    t.string  "Email"
    t.string  "LeadSource"
    t.date    "Birthdate"
    t.string  "Personal_Email__c"
    t.string  "Gender"
    t.string  "ASU_Gmail__c"
    t.boolean "Arizona_Resident__c"
    t.string  "Visa_Type__c"
    t.decimal "Undergraduate_GPA__c",   precision: 3, scale: 2
    t.decimal "Jr_Sr_GPA__c",           precision: 3, scale: 2
    t.string  "Military_Status__c"
    t.string  "Military_Branch__c"
    t.string  "Email_Status__c"
    t.string  "Marital_Status__c"
    t.string  "Ethnicity"
    t.boolean "FERPA__c"
    t.string  "Undergraduate_Major__c"
    t.decimal "Graduate_GPA__c",        precision: 3, scale: 2
    t.string  "Contact_Preference__c"
    t.string  "Student_Number__c"
    t.string  "ASURite_ID__c"
    t.boolean "Deceased__c"
    t.string  "ASU_Email__c"
  end

end
