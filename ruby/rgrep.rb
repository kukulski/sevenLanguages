#!/usr/bin/ruby



def grep(filename, matched_string)
    puts "grepping '#{filename}' for '#{matched_string}'"
    file = File.open(filename,"r");
        
        begin 
            line = file.gets
            puts "#{file.lineno}: #{line}" if (line && line.include?(matched_string) )
        end while line

end

argv = ARGV
grep(argv[0], argv[1])