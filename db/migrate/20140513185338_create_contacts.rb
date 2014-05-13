class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :sfdc_id
      t.string :FirstName
      t.string :LastName
      t.string :MailingStreet
      t.string :MailingCity
      t.string :MailingState
      t.string :MailingPostalCode
      t.string :MailingCountry
      t.integer :Phone
      t.integer :Fax
      t.string :Email
      t.date :Birthdate
      t.string :Gender
      t.decimal :GPAUnder, :precision => 3, :scale => 2
      t.decimal :GPAJrSr, :precision => 3, :scale => 2
    end
  end
end
