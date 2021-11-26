#!/home/tebako/bin/ruby

def glob_files_in_dir(glob, base_path)
    Dir.glob(glob, base: base_path).map! {|f| File.expand_path(f, base_path) }
end

def gemspec_stubs_in(dir, pattern)
    glob_files_in_dir(pattern, dir).map { |path| yield path }.select(&:valid?)
end


puts 'Hello!  This is test-1 talking from inside DwarFS'
puts 'Gem.path=' + Gem.path.to_s()

dirs = Gem.path

dirs.flat_map do |dir|
    gems_dir = File.join dir, "gems"
    glb = Dir.glob("*", base: gems_dir) 

    puts "\n===>  " + glb.size.to_s() + " gems at " + gems_dir.to_s() + "\n\n"
    puts glb.map { |path| 
       File.expand_path(path, dir) 
    }    


#Dir.glob("*", base: dir).map! {|f| 
 #   File.expand_path(f, dir) 
#    puts f.to_s()
#    
#    f.map { |path| puts path.to_s() }
#}
 end
