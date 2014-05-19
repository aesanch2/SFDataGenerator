require 'faker'
require 'populator'

namespace:db do
  desc "Create some fake Contacts to generate real SFDC ids"
  task :fake_contacts => :environment do
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
    bool = ['true', 'false']

    #create the contacts
    Contacts.populate num_contacts do |con|
      Faker::Config.locale = 'en-us'
      fName = Faker::Name.first_name
      lName = Faker::Name.last_name
      email = Faker::Internet.safe_email(fName)
      title = salutation.at(rand(0..4))
      con.FirstName = fName
      con.LastName = lName
      con.Salutation = title
      con.RoverStatus = 'No'
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
      con.HasOptedOutOfEmail = bool
      con.HasOptedOutOfFax = bool
      con.DoNotCall = bool
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
      con.Arizona_Resident__c = bool
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
      con.FERPA__c = bool
      con.Undergraduate_Major__c = major
      #logic to randomize Graduate status
      graduate = rand(1..10)
      if(graduate%2 == 0)
        con.Graduate_GPA__c = rand(3.00..4.00)
      end
      con.Contact_Preference__c = contactPref
      con.Student_Number__c = Faker::Number.number(10)
      con.ASURite_ID__c = '120' + Faker::Number.number(7)
      con.Deceased__c = 'false'
      con.ASU_Email__c = fName + '.' + lName + '@asuFake.edu'
    end

    print "#{num_contacts} created.\n"
  end

  desc "Create some fake Leads"
  task :fake_leads => :environment do
    print "How many fake Leads do you want?"
    num_leads = $stdin.gets.to_i

    #picklists
    salutation = ['Mr.', 'Ms.', 'Mrs.', 'Dr.', 'Prof']
    leadsources = ['Advertisement', 'ASU UG', 'College Fair - Int', 'College Fair - US', 'Email', 'Employee Referral', 'Event', 'Partial App', 'PeopleSoft', 'Phone Call', 'Purchased List', 'Test Scores', 'Walk-in', 'Web Form']
    status = ['Open', 'Prospect', 'Inactive']
    rating = ['Hot', 'Warm', 'Cold']
    gender = ['Male', 'Female', 'Unknown']
    research = ['Unknown', 'No', 'Yes']
    degreeType = ['Masters', 'Doctoral', 'Certificate', 'Non-Degree']
    contactPref = ['Home Phone', 'Local Phone', 'Mobile Phone', 'Email']
    courseLoad = ['Part-time', 'Full-time', 'Undecided', 'No response']
    ethnicity = ['Am. Indian Alaska Native', 'Asian', 'Black African-American', 'Hispanic', 'Pacific Islander', 'White']
    crm = ['GC1000 series', 'GC5000 series', 'GC3000 series']
    vetStatus = ['I am active duty', 'I am a veteran', 'I am a spouse or dependent of an active duty or veteran', 'National Guard', 'Reserves']
    enrollmentTerm = ['2014 Fall', '2015 Spring', '2015 Fall', '2016 Spring', '2016 Fall', '2017 Spring', '2017 Fall'] #future terms only
    college = ['GRAS', 'GRBA', 'GRCS', 'GRES', 'GRGC', 'GRHI', 'GRLA', 'GRNH', 'GRNU', 'GRPP', 'GRSU', 'GRTE', 'GRTS', 'LWLW']
    leadSub = ['Coll Technology & Innovation', 'College Of Public Programs', 'Cronkite School-Journ/MassComm', 'Graduate Education', 'Health Solutions',
    'Herberger Institute', 'Ira A Fulton Engineering', 'Liberal Arts & Sciences', 'MaryLouFulton Teachers College', 'New Interdis Arts & Sciences',
    'Nursing & Health Innovation', 'School of Letters & Sciences', 'School of Sustainability', 'W.P. Carey School Of Business','O\'College of Law',
    'ASU Online', 'Degree Search', 'USA Today', 'Conference', 'EGSS Applying', 'EGSS Financing', 'EGSS GRE Prep', 'EGSS Personal Statement', 'Info Session - Campus',
    'Info Session - Online', 'GRE', 'GRE Subject', 'TOEFL', 'NNE', 'CA Diversity', 'Idealist', 'Graduate College', 'NAU', 'Import']
    emailStatus = ['Role', 'Temp', 'Valid']
    bool = ['true', 'false']

    #Create the leads
    Leads.populate num_leads do |ld|
      Faker::Config.locale = 'en-us'
      fName = Faker::Name.first_name
      lName = Faker::Name.last_name
      email = Faker::Internet.safe_email(lName)
      title = salutation.at(rand(0..4))
      ld.LastName = lName
      ld.FirstName = fName
      ld.Salutation = title
      ld.Company = Faker::Company.name
      ld.Street = Faker::Address.street_address
      ld.City = Faker::Address.city
      ld.State = Faker::Address.state
      ld.PostalCode = Faker::Address.postcode
      ld.Country = 'United States'
      ld.Phone = Faker::PhoneNumber.phone_number
      ld.MobilePhone = Faker::PhoneNumber.phone_number
      ld.Fax = Faker::PhoneNumber.phone_number
      ld.Email = email
      ld.LeadSource = leadsources
      ld.Status = status
      ld.Rating = rating
      ld.HasOptedOutOfEmail = bool
      ld.IsConverted = 'false'
      ld.IsUnreadByOwner = bool
      ld.DoNotCall = bool
      ld.HasOptedOutOfFax = bool
      #Gender logic
      case title
      when 'Mr.'
        ld.Gender = 'Male'
      when 'Ms.'
        ld.Gender = 'Female'
      when 'Mrs.'
        ld.Gender = 'Female'
      else
        ld.Gender = gender
      end
      ld.Date_of_Birth__c = 25.years.ago...18.years.ago
      ld.Recruiting_Email__c = email
      ld.Degree_Type__c = degreeType
      #ld.Academic_Plan_List__c =
      ld.Research_Experience__c = research
      ld.Contact_Preference__c = contactPref
      ld.ASU_Student__c = bool
      ld.Course_Load__c = courseLoad
      ld.Secondary_Email__c = Faker::Internet.safe_email(fName)
      #logic to randomize Undergraduate status
      undergrad = rand(1..10)
      if(undergrad%2 == 0)
        ld.Undergraduate_GPA__c = rand(1.00..4.00)
        ld.Jr_Sr_GPA__c = rand(1.00..4.00)
      end
      ld.Ethnicity__c = ethnicity
      ld.CRMfusionDBR101__ProductInterest__c = crm
      ld.Veteran_Status__c = vetStatus
      ld.Enrollment_Term__c = enrollmentTerm
      ld.Test_Record__c = bool
      ld.College__c = college
      ld.Lead_Source_Subtype__c = leadSub
      ld.Email_Status__c = emailStatus
    end

    print "#{num_leads} created.\n"
  end

  desc "Create some fake Cases using given Account Ids"
  task :fake_cases => :environment do
    #prompt for Account Ids
    print "Enter some validated Account Ids (separated by a space): "
    accounts = $stdin.gets.split(" ").map { |s| s }
    print "Enter some validated Contact Ids (separated by a space): "
    contacts = $stdin.gets.split(" ").map { |s| s }
    print "Enter some validated Lead Ids (separated by a space): "
    leads = $stdin.gets.split(" ").map { |s| s }
    print "How many cases do you want? "
    num_cases = $stdin.gets.to_i

    #picklists
    types = ['Problem', 'Feature Request', 'Question']
    status = ['On Hold', 'Escalated', 'Closed', 'New']
    reason = ['User didn\'t attend training', 'Complex functionality', 'Existing problem', 'Instructions not clear', 'New problem']
    origin = ['Email', 'Phone', 'Web']
    priority = ['High', 'Medium', 'Low']

    #Create the cases
    Cases.populate num_cases do |ca|
      index = rand(0..accounts.length-1)
      account = accounts.fetch(index)
      contact = contacts.fetch(index)
      leadOnly = rand(1..10)
      if(leadOnly%2 == 0)
        ca.Lead__c = leads
      else
        ca.AccountId = account
        ca.ContactId = contact
      end
      ca.Type = types
      ca.Status = status
      ca.Reason = reason
      ca.Origin = origin
      ca.Subject = Faker::Company.catch_phrase
      ca.Priority = priority
      ca.Description = Faker::Company.bs
    end

    print "#{num_cases} created.\n"
  end
end
