#---
# Excerpted from "Seven Languages in Seven Weeks",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/btlang for more book information.
#---
module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end
  
  module InstanceMethods   
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')
        
      file.each do |row|
          contents = row.chomp.split(', ')
          row = CsvRow.new(@headers,contents)
          @csv_contents << row
      end
    end
    
    attr_accessor :headers, :csv_contents
    def initialize
      read 
    end
     
    def each(&block)
        #has to be a better way, I just don't know the syntax
       @csv_contents.each { |elt| block.call(elt) }
    end
      
      class CsvRow
          #  class <<self; attr_accessor :headers end
      
          def initialize(headers, data)
              @headers = headers
              @data = data
          end
          
          def method_missing name, *args
              @data[@headers.index(name.to_s)]
          end
          
      end #Csvrow

      
end #InstanceMethods
    



end #ActAsCSV



class RubyCsv  # no inheritance! You can mix it in
  include ActsAsCsv
  acts_as_csv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect

puts 'now my code'

m.each {|row| puts row.last}