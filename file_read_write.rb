File.open('README.md', 'r') do |f|
  while line = f.gets
    puts line
  end
end

File.open('writefile.txt', 'w') do |f|
  f.puts "I write a line to file"
end

