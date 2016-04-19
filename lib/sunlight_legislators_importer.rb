require 'csv'


class SunlightLegislatorsImporter
  def self.import(filename)
    csv = CSV.new(File.open(filename), :headers => true)
    csv.each do |row|

      hash = Hash.new
      not_needed_columns = %w( nickname district congress_office bioguide_id votesmart_id fec_id govtrack_id crp_id congresspedia_url
                               youtube_url facebook_id official_rss senate_class )
      row.each do |field, value|
        unless not_needed_columns.include?(field)
          hash[field] = value
        end
      end
      # hash => { :firstname => "kevin", :lastname => "sia", :gender => 'm'}
      Legislator.create(hash)
    end
  end
end

# IF YOU WANT TO HAVE THIS FILE RUN ON ITS OWN AND NOT BE IN THE RAKEFILE, UNCOMMENT THE BELOW
# AND RUN THIS FILE FROM THE COMMAND LINE WITH THE PROPER ARGUMENT.
# begin
#   raise ArgumentError, "you must supply a filename argument" unless ARGV.length == 1
#   SunlightLegislatorsImporter.import(ARGV[0])
# rescue ArgumentError => e
#   $stderr.puts "Usage: ruby sunlight_legislators_importer.rb <filename>"
# rescue NotImplementedError => e
#   $stderr.puts "You shouldn't be running this until you've modified it with your implementation!"
# end
