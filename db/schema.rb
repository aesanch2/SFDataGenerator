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

ActiveRecord::Schema.define(version: 20140519215130) do

  create_table "cases", force: true do |t|
    t.string "sfdc_id"
    t.string "CaseNumber"
    t.string "ContactId"
    t.string "AccountId"
    t.string "Type"
    t.string "Status"
    t.string "Reason"
    t.string "Origin"
    t.string "Subject"
    t.string "Priority"
    t.string "Description"
    t.string "Lead__c"
  end

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
    t.string  "HasOptedOutOfEmail"
    t.string  "HasOptedOutOfFax"
    t.string  "DoNotCall"
    t.string  "Personal_Email__c"
    t.string  "Gender"
    t.string  "ASU_Gmail__c"
    t.string  "Arizona_Resident__c"
    t.string  "Visa_Type__c"
    t.decimal "Undergraduate_GPA__c",   precision: 3, scale: 2
    t.decimal "Jr_Sr_GPA__c",           precision: 3, scale: 2
    t.string  "Military_Status__c"
    t.string  "Military_Branch__c"
    t.string  "Email_Status__c"
    t.string  "Marital_Status__c"
    t.string  "Ethnicity"
    t.string  "FERPA__c"
    t.string  "Undergraduate_Major__c"
    t.decimal "Graduate_GPA__c",        precision: 3, scale: 2
    t.string  "Contact_Preference__c"
    t.string  "Student_Number__c"
    t.string  "ASURite_ID__c"
    t.string  "Deceased__c"
    t.string  "ASU_Email__c"
    t.string  "Test_Record__c"
  end

  create_table "leads", force: true do |t|
    t.string  "sfdc_id"
    t.string  "LastName"
    t.string  "FirstName"
    t.string  "Salutation"
    t.string  "Title"
    t.string  "Company"
    t.string  "Street"
    t.string  "City"
    t.string  "State"
    t.string  "PostalCode"
    t.string  "Country"
    t.string  "Phone"
    t.string  "MobilePhone"
    t.string  "Fax"
    t.string  "Email"
    t.string  "Website"
    t.string  "Description"
    t.string  "LeadSource"
    t.string  "Status"
    t.string  "Rating"
    t.string  "HasOptedOutOfEmail"
    t.string  "IsConverted"
    t.string  "IsUnreadByOwner"
    t.string  "DoNotCall"
    t.string  "HasOptedOutOfFax"
    t.string  "Gender"
    t.date    "Date_of_Birth__c"
    t.string  "Recruiting_Email__c"
    t.string  "Degree_Type__c"
    t.string  "Academic_Plan_list__c"
    t.string  "Research_Experience__c"
    t.string  "Contact_Preference__c"
    t.string  "ASU_Student__c"
    t.string  "Course_Load__c"
    t.string  "Secondary_Email__c"
    t.decimal "Undergraduate_GPA__c"
    t.string  "Ethnicity__c"
    t.string  "CRMfusionDBR101__ProductInterest__c"
    t.decimal "Jr_Sr_GPA__c"
    t.string  "Veteran_Status__c"
    t.string  "Enrollment_Term__c"
    t.string  "Test_Record__c"
    t.string  "College__c"
    t.string  "Online__c"
    t.string  "Lead_Source_Subtype__c"
    t.string  "Email_Status__c"
  end

end
