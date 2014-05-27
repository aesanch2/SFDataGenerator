require 'faker'
require 'populator'

namespace:db do
  desc "Create some fake Leads"
  task :fake_leads => :environment do
    print "How many fake Leads do you want?"
    num_leads = $stdin.gets.to_i

    #picklists
    salutation = ['Mr.', 'Ms.', 'Mrs.', 'Dr.', 'Prof']
    leadsources = ['Advertisement', 'ASU UG', 'College Fair - Int',
      'College Fair - US', 'Email', 'Employee Referral', 'Event',
      'Partial App', 'PeopleSoft', 'Phone Call', 'Purchased List',
      'Test Scores', 'Walk-in', 'Web Form']
    status = ['Open', 'Prospect', 'Inactive']
    rating = ['Hot', 'Warm', 'Cold']
    gender = ['Male', 'Female', 'Unknown']
    research = ['Unknown', 'No', 'Yes']
    degreeType = ['Masters', 'Doctoral', 'Certificate', 'Non-Degree']
    contactPref = ['Home Phone', 'Local Phone', 'Mobile Phone', 'Email']
    courseLoad = ['Part-time', 'Full-time', 'Undecided', 'No response']
    ethnicity = ['Am. Indian Alaska Native', 'Asian', 'Black African-American',
       'Hispanic', 'Pacific Islander', 'White']
    crm = ['GC1000 series', 'GC5000 series', 'GC3000 series']
    vetStatus = ['I am active duty', 'I am a veteran',
       'I am a spouse or dependent of an active duty or veteran',
       'National Guard', 'Reserves']
    enrollmentTerm = ['2014 Fall', '2015 Spring', '2015 Fall', '2016 Spring',
       '2016 Fall', '2017 Spring', '2017 Fall'] #future terms only
    college = ['GRAS', 'GRBA', 'GRCS', 'GRES', 'GRGC', 'GRHI', 'GRLA', 'GRNH',
       'GRNU', 'GRPP', 'GRSU', 'GRTE', 'GRTS', 'LWLW']
    leadSub = ['Coll Technology & Innovation', 'College Of Public Programs',
      'Cronkite School-Journ/MassComm', 'Graduate Education',
      'Health Solutions', 'Herberger Institute', 'Ira A Fulton Engineering',
      'Liberal Arts & Sciences', 'MaryLouFulton Teachers College',
      'New Interdis Arts & Sciences',
      'Nursing & Health Innovation', 'School of Letters & Sciences',
      'School of Sustainability', 'W.P. Carey School Of Business',
      'O\'College of Law', 'ASU Online', 'Degree Search', 'USA Today',
      'Conference', 'EGSS Applying', 'EGSS Financing', 'EGSS GRE Prep',
      'EGSS Personal Statement', 'Info Session - Campus',
      'Info Session - Online', 'GRE', 'GRE Subject', 'TOEFL', 'NNE',
      'CA Diversity', 'Idealist', 'Graduate College', 'NAU', 'Import']
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
end
