class CreateCompleteContacts < ActiveRecord::Migration
  def change
    create_table :complete_contacts do |t|
      t.string :sfdc_id
      t.string :FirstName
      t.string :LastName
      t.string :Salutation
      t.string :OtherStreet
      t.string :OtherCity
      t.string :OtherState
      t.string :OtherPostalCode
      t.string :OtherCountry
      t.string :MailingStreet
      t.string :MailingCity
      t.string :MailingState
      t.string :MailingPostalCode
      t.string :MailingCountry
      t.integer :Phone
      t.integer :Fax
      t.integer :MobilePhone
      t.integer :HomePhone
      t.integer :OtherPhone
      t.string :Email
      t.string :LeadSource
      t.date :Birthdate
      t.string :Personal_Email__c
      t.string :Gender
      t.string :ASU_Gmail__c
      t.boolean :Arizona_Resident__c
      t.string :Visa_Type__c
      t.decimal :Undergraduate_GPA__c, :precision => 3, :scale => 2
      t.decimal :Jr_Sr_GPA__c, :precision => 3, :scale => 2
      t.string :Military_Status__c
      t.string :Military_Branch__c
      t.string :Email_Status__c
      t.string :Marital_Status__c
      t.string :Ethnicity
      t.boolean :FERPA__c
      t.string :Undergraduate_Major__c
      t.decimal :Graduate_GPA__c, :precision => 3, :scale => 2
      t.string :Contact_Preference__c
      t.string :Student_Number__c
      t.string :ASURite_ID__c
      t.boolean :Deceased__c
      t.string :ASU_Email__c
    end
  end
end
