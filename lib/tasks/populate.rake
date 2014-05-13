require 'faker'
require 'populator'

namespace:db do
  desc "Create some fake Contacts to generate real SFDC ids"
  task :fake_contact => :environment do
    print "How many fake Contacts do you want? "
    num_contacts = $stdin.gets.to_i

    gender = ['Male', 'Female', 'Unknown']

    #create the contacts
    Contacts.populate num_contacts do |con|
      Faker::Config.locale = 'en-us'
      fName = Faker::Name.first_name
      lName = Faker::Name.last_name
      con.FirstName = fName
      con.LastName = lName
      con.MailingStreet = Faker::Address.street_address
      con.MailingCity = Faker::Address.city
      con.MailingState = Faker::Address.state
      con.MailingPostalCode = Faker::Address.postcode
      con.MailingCountry = 'United States'
      con.Phone = Faker::Number.number(10)
      con.Fax = Faker::Number.number(10)
      con.Email = fName + '.' + lName + '@asu.testmail'
      con.Birthdate = 25.years.ago.strptime("%F")...18.years.ago.strptime("%F")
      con.Gender = gender
      con.GPAUnder = rand(1.00...4.00)
      con.GPAJrSr = rand(1.00...4.00)
    end

    print "#{num_contacts} created.\n"
  end
end
