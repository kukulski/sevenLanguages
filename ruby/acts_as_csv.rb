class NotMeta < Array 
    

    def initialize(headers) 
        
        headers.each_index {|idx|
            name = headers[idx]
            sym = name.to_sym
            
            define_method(sym) do
                fetch(idx)
            end # define_method
        }
        
        
    end
end
    

class ActsAsCsv
  def self.acts_as_csv
    
    define_method 'read' do
      file = File.new(self.class.to_s.downcase + '.txt')
      @headers = file.gets.chomp.split(', ')

    
    # woudl be better to make a class instead of touching each item
    # trying to avoid stomping on Array itself
    
      file.each do |row|
        chomped_row = row.chomp.split(', ')
        map_headers(chomped_row)
        not_meta = NotMeta.new(@headers)
        not_meta.concat chomped_row
    
        @result << not_meta
      end
    end
    
    define_method "headers" do
      @headers
    end
    
    define_method "csv_contents" do
      @result
    end

    
    define_method(:each) do |&block|
        @result.each { |elt| 
            block.call(elt) 
        }
    end


    define_method 'initialize' do
      @result = []
      read
    end


  end

 def map_headers(row)
     
 
     
     
     end


end






class RubyCsv < ActsAsCsv
  acts_as_csv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect
puts 'now my code'
m.csv_contents.each {|row| puts row.inspect}
puts 'and my each impl'
m.each {|row| puts row.inspect}
puts 'and my method_missing impl'
m.each {|row| puts row.last}
