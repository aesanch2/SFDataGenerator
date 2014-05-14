require 'faker'
require 'populator'

namespace:db do
  desc "Create some fake Contacts to generate real SFDC ids"
  task :fake_contact => :environment do
    print "How many fake Contacts do you want? "
    num_contacts = $stdin.gets.to_i

    salutation = ['Mr.', 'Ms.', 'Mrs.', 'Dr.', 'Prof']
    leadsources = ['Advertisement', 'ASU UG', 'College Fair - Int', 'College Fair - US', 'Email', 'Employee Referral', 'Event', 'Partial App', 'PeopleSoft', 'Phone Call', 'Purchased List', 'Test Scores', 'Walk-in', 'Web Form']
    gender = ['Male', 'Female', 'Unknown']
    milStatus = ['Active Duty', 'National Guard', 'Veteran', 'Spouse/Dependent', 'Armed Forces Reserve']
    milBranch = ['Air Force', 'Army', 'Coast Guard', 'Marines', 'Navy']
    emailStatus = ['Role', 'Temp', 'Valid']
    maritalStatus = ['Single', 'Married', 'Divorced', 'Unknown']
    ethnicity = ['Am. Indian Alaska Native', 'Asian', 'Black African-American', 'Hispanic', 'Pacific Islander', 'White']
    major = ['Computer Science', 'Biology', 'Business', 'Mechanical Engineering', 'Political Science', 'Mathematics', 'Economics', 'Psychology']
    contactPref = ['Home Phone', 'Local Phone', 'Mobile Phone', 'Email']

    #create the contacts
    CompleteContacts.populate num_contacts do |con|
      Faker::Config.locale = 'en-us'
      fName = Faker::Name.first_name
      lName = Faker::Name.last_name
      email = Faker::Internet.safe_email(fName)
      title = salutation.at(rand(0..4))
      con.FirstName = fName
      con.LastName = lName
      con.Salutation = title
      con.OtherStreet = Faker::Address.street_address
      con.OtherCity = Faker::Address.city
      con.OtherState = Faker::Address.state
      con.OtherPostalCode = Faker::Address.postcode
      con.OtherCountry = 'United States'
      con.MailingStreet = Faker::Address.street_address
      con.MailingCity = Faker::Address.city
      con.MailingState = Faker::Address.state
      con.MailingPostalCode = Faker::Address.postcode
      con.MailingCountry = 'United States'
      con.Phone = Faker::PhoneNumber.phone_number
      con.Fax = Faker::PhoneNumber.phone_number
      con.MobilePhone = Faker::PhoneNumber.phone_number
      con.HomePhone = Faker::PhoneNumber.phone_number
      con.OtherPhone = Faker::PhoneNumber.phone_number
      con.Email = email
      con.LeadSource = leadsources
      con.Birthdate = 25.years.ago...18.years.ago
      con.Personal_Email__c = email
      #Gender logic
      case title
      when 'Mr.'
        con.Gender = 'Male'
      when 'Ms.'
        con.Gender = 'Female'
      when 'Mrs.'
        con.Gender = 'Female'
      else
        con.Gender = gender
      end
      con.ASU_Gmail__c = (fName + "@asu.gmail")
      #resident = rand(1..10)
      #if (resident%2 == 0)
      #  con.Arizona_Resident__c = true
      #else
      #  con.Arizona_Resident__c = false
      #end
      con.Undergraduate_GPA__c = rand(1.00...4.00)
      con.Jr_Sr_GPA__c = rand(1.00...4.00)
      #military logic
      mil1 = rand(10..20)
      mil2 = rand(10..20)
      milMember = false
      if (mil1 == mil2)
        con.Military_Status__c = milStatus
        milMember = true
      end
      if(milMember)
        con.Military_Branch__c = milBranch
      end
      con.Email_Status__c = emailStatus
      case title
      when 'Mrs.'
        con.Marital_Status__c = 'Married'
      when 'Ms.'
        con.Marital_Status__c = 'Single'
      else
        con.Marital_Status__c = maritalStatus
      end
      con.Ethnicity = ethnicity
      #logic to randomize FERPA
      #ferpa = rand(1..10)
      #if (ferpa%2 == 0)
      #  con.FERPA__c = true
      #else
      #  con.FERPA__c = false
      #end
      con.Undergraduate_Major__c = major
      #logic to randomize Graduate status?
      graduate = rand(1..10)
      if(graduate%2 == 0)
        con.Graduate_GPA__c = rand(3.00..4.00)
      end
      con.Contact_Preference__c = contactPref
      con.Student_Number__c = Faker::Number.number(10)
      con.ASURite_ID__c = '120' + Faker::Number.number(7)
      #con.Deceased__c = false
      con.ASU_Email__c = fName + '.' + lName + '@asuFake.edu'
    end

    print "#{num_contacts} created.\n"
  end
end
