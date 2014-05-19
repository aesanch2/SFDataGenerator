class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :sfdc_id
      t.string :LastName
      t.string :FirstName
      t.string :Salutation
      t.string :Title
      t.string :Company
      t.string :Street
      t.string :City
      t.string :State
      t.string :PostalCode
      t.string :Country
      t.string :Phone
      t.string :MobilePhone
      t.string :Fax
      t.string :Email
      t.string :Website
      t.string :Description
      t.string :LeadSource #picklist
      t.string :Status #picklist
      t.string :Rating #picklist
      t.string :HasOptedOutOfEmail #bool
      t.string :IsConverted #bool = false
      t.string :IsUnreadByOwner #bool
      t.string :DoNotCall #bool
      t.string :HasOptedOutOfFax
      t.string :Gender
      t.date :Date_of_Birth__c
      t.string :Recruiting_Email__c
      t.string :Degree_Type__c #picklist
      t.string :Academic_Plan_list__c
      t.string :Research_Experience__c #picklist
      t.string :Contact_Preference__c #picklist
      t.string :ASU_Student__c #picklist
      t.string :Course_Load__c #picklist
      t.string :Secondary_Email__c
      t.decimal :Undergraduate_GPA__c
      t.string :Ethnicity__c #picklist
      t.string :CRMfusionDBR101__ProductInterest__c #picklist
      t.decimal :Jr_Sr_GPA__c
      t.string :Veteran_Status__c #picklist
      t.string :Enrollment_Term__c #picklist
      t.string :Test_Record__c #bool
      t.string :College__c #picklist
      t.string :Online__c #bool
      t.string :Lead_Source_Subtype__c #picklist
      t.string :Email_Status__c #picklist
    end
  end
end
