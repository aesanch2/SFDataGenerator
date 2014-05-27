require 'faker'
require 'populator'

namespace:db do
  desc "Create some fake Cases using given Account Ids"
  task :fake_cases => :environment do
    #prompt for Account Ids
    begin
      print "Enter 1 for Accounts/Contacts, 2 for Leads, 3 for both: "
      switch = $stdin.gets.to_i
      flag = true
      if (switch > 0 && switch < 4)
        flag = false
      else
        print "Wrong number. Try again.\n"
      end
    end while (flag)
    case switch
    when 1
      accounts = accountList()
      contacts = contactList()
    when 2
      leads = leadList()
    else
      accounts = accountList()
      contacts = contactList()
      leads = leadList()
    end

    print "How many cases do you want? "
    num_cases = $stdin.gets.to_i

    #picklists
    types = ['Problem', 'Feature Request', 'Question']
    status = ['On Hold', 'Escalated', 'Closed', 'New']
    reason = ['User didn\'t attend training', 'Complex functionality',
      'Existing problem', 'Instructions not clear', 'New problem']
    origin = ['Email', 'Phone', 'Web']
    priority = ['High', 'Medium', 'Low']
    categories = ['1098-T', 'Collections', 'Counselor', 'Customer Services',
      'Document Processing', 'Downtown Campus', 'Graduate Applicant Status',
      'Graduation', 'International', 'Late Fee Appeals', 'Loan Research',
      'Non-Degree','Office Specialist', 'Online Student', 'Other',
      'Out Going Transcripts', 'Poly Campus', 'QA Research', 'Registrar',
      'RegTech', 'Residency', 'Returned Mail', 'Scholarship Research',
      'Sponsor Billings', 'Sponsored Apps', 'Student Accounts',
      'Student Business Services', 'Tempe Cashiering',
      'TIP Late Resgistration Appeals', 'Tuition Calculation Issues',
      'VA Billing']

    #Create the cases
    Cases.populate num_cases do |ca|
      index = rand(0..accounts.length-1)
      case switch
      when 1
        account = accounts.fetch(index)
        contact = contacts.fetch(index)
        ca.AccountId = account
        ca.ContactId = contact
      when 2
        ca.Lead__c = leads
      else
        leadOnly = rand(1..10)
        if(leadOnly%2 == 0)
          ca.Lead__c = leads
        else
          ca.AccountId = account
          ca.ContactId = contact
        end
      end
      ca.Type = types
      ca.Status = status
      ca.Reason = reason
      ca.Origin = origin
      ca.Subject = Faker::Company.catch_phrase
      ca.Priority = priority
      ca.Description = Faker::Company.bs
      ca.Category__c = categories
      ca.Functional_Group__c = categories
      #ca.Private_Note_Financial_Aid__c =
      #ca.Private_Note_Graduate_Admission__c =
      #ca.Private_Note_Registrar__c =
      #ca.Private_Note_Student_Business_Services__c =
    end

    print "#{num_cases} created.\n"
  end

  def accountList()
    print "Enter some validated Account Ids (separated by a space): "
    accounts = $stdin.gets.split(" ").map { |s| s }
    return accounts
  end

  def contactList()
    print "Enter some validated Contact Ids (separated by a space): "
    contacts = $stdin.gets.split(" ").map { |s| s }
    return contacts
  end

  def leadList()
    print "Enter some validated Lead Ids (separated by a space): "
    leads = $stdin.gets.split(" ").map { |s| s }
    return leads
  end

end
