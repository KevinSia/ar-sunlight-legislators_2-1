class Legislator < ActiveRecord::Base
  def name
    "#{firstname} #{middlename} #{lastname} #{name_suffix}"
  end

  class << self
      # helpers
    def print_state_senator(state)
      senators = Legislator.where('state = ? AND title = ?', state, "Sen").order(:lastname)
      puts "Senators"
      senators.each do |senator|
        puts "  #{senator.name} (#{senator.party})"
      end
    end

    def print_state_representative(state)
      representatives = Legislator.where('state = ? AND title = ?', state, "Rep").order(:lastname)
      puts "Representatives"
      representatives.each do |rep|
        puts "  #{rep.name} (#{rep.party})"
      end
    end

    # main methods
    def print_state_legislators(state)
      print_state_senator(state)
      print_state_representative(state)
    end

    def print_gender_ratio(gender)
      total_count = Legislator.count
      senator_count = Legislator.where('gender = ? and title = ?', gender, "Sen").count
      representative_count = Legislator.where('gender = ? and title = ?', gender, "Rep").count

      senator_ratio = (senator_count.to_f / total_count.to_f * 100).to_i
      reprensentative_ratio = (representative_count.to_f / total_count.to_f * 100).to_i

      gender == 'M' ? gender = 'Male' : gender = 'Female'

      puts "#{gender} Senator: #{senator_count} (#{senator_ratio}%)"
      puts "#{gender} Representatives: #{representative_count} (#{reprensentative_ratio}%)"
    end

    def list_state
      states =  Legislator.group(:state).order('count(*) desc').count.keys
      states.each do |state|
        print "#{state}: #{Legislator.where('title = ? and state = ?', "Sen", state).count} Senators, "
        puts "#{Legislator.where('title = ? and state = ?', "Rep", state).count} Representative(s)"
      end
    end

    def list_all_legislators
      hash = Legislator.group(:title).order('count(*) desc').count
      hash.each do |key, value|
        puts "#{key}: #{value}"
      end
    end

    def list_in_office_legislators
      hash = Legislator.group(:title, :in_office).order('count(*) desc').count
      hash.each do |key, value|
        if key[1]
          puts "#{key[0]} : #{value}"
        end
      end
    end
  end
end