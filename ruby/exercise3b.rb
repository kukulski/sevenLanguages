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
        
      CsvRow.headers = @headers;
        
      file.each do |row|
          contents = row.chomp.split(', ')
          row = CsvRow.new(contents)
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
          
          def self.headers=(heads)
            heads.each_index { |idx| add_field(heads[idx],idx) }
          end

          def self.add_field(name,idx) 
            define_method(name) do
                @data[idx]
            end 
          end
      
          def initialize(data)
              @data = data
          end
          
          def method_missing name, *args
             "#{name} missing"
          end
          
      end #Csvrow

      
end #InstanceMethods
    



end #ActAsCSV



class RubyCsv  # no inheritance! You can mix it in
  include ActsAsCsv
  acts_as_csv
end


class CollideTest  # no inheritance! You can mix it in
    include ActsAsCsv
    acts_as_csv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect

puts 'now my code'

m.each {|row| puts row.fish}
m.each {|row| puts row.last}

n = CollideTest.new
n.each {|row| puts "#{row.last} fish #{row.fish}"}
