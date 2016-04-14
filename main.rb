require_relative 'db/config'

def list_representative(state)
  legislators = Legislator.where('state = ? AND title = ?', state, "Rep")
  legislators.each do |legislator|
    print "#{legislator.id}".center(5)
    print "#{legislator.firstname}".center(30)
    puts " #{legislator.state}".center(10)
  end
  nil
end

def list_senator(state)
  Legislator.where('state = ? AND title = ?', state, "Sen")
end

def list_senator_party(party)
  Legislator.where('p
    arty = ? AND title = ?', party, "Sen")
end

def list_representative_party(party)
  Legislator.where('party = ? AND title = ?', party, "Rep")
end      

def list_profile(id)
  legislator = Legislator.find(id)
    legislator.firstname
    legislator.middlename
    legislator.lastname
    legislator.phone
    legislator.fax
    legislator.website
    legislator.party
    legislator.gender
    legislator.birthdate
    legislator.twitter_id
end

def list_office_active(id)
  legislator = Legislator.find(id)
    unless legislator.in_office
      puts "#{legislator.firstname} not in office la"
    else
      puts "#{legislator.firstname} in office la"
    end
end

# puts "Welcome to My App"
# puts "What do you want to do?"
# puts "1. List all representatives in a state"
# puts "2. List all senators in a state"
# puts "3. List all representatives with a party affiliation"
# puts
