require 'csv'

class Importer
  def self.import(filename)
    csv = CSV.new(File.open(filename), :headers => true)
    csv.each do |row|

      row.each do |field, value|
        print "#{field}"
        print " #{value}\n"
      end
      # hash = Hash.new
      # not_needed_columns = ["nickname", ":district"]
      # row.each do |field, value|
      #   unless not_needed_columns.include?(field)
      #     hash[field] = value
      #   end
      # end

      # # hash => { :firstname => "kevin", :lastname => "sia", :gender => 'm'}

      # Legislator.create(hash)
    end
  end
end

Importer.import('db/data/legislators.csv')