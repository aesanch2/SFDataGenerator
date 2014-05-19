class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.string :sfdc_id
      t.string :CaseNumber
      t.string :ContactId
      t.string :AccountId
      t.string :Type
      t.string :Status
      t.string :Reason
      t.string :Origin
      t.string :Subject
      t.string :Priority
      t.string :Description
      t.string :Lead__c
    end
  end
end
