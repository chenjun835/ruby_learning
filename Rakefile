task :default => 'morning:turn_off_alarm'

directory "tmp"

file "tmp/hello.tmp" => "tmp" do
  sh "echo 'hello' >> 'tmp/hello.tmp'"
end

namespace :morning do
  desc "Turn off alarm"
  task :turn_off_alarm do
    puts "Turned off alarm. Would have liked 5 more minutes, though."
  end

  desc "Take care of normal hygeine tasks"
  task :groom_myself do
    puts "Brushed teeth"
    puts "Showered."
    puts "Shaved"
  end

  desc "Make coffee"
  task :make_coffee do
    cups = ENV["COFFEE_CUPS"] || 2
    puts "Made #{cups} cups of coffee. Shakes are gone."
  end

  desc "Walk the dog"
  task :walk_dog do
    puts "Dog walked."
  end

  desc "Get ready for the day"
  task :ready_for_the_day => [:turn_off_alarm, :groom_myself, :make_coffee, :walk_dog] do
    puts "Ready for the day!"
  end
end

namespace :morning do
  task :groom_myself do
    puts "Styled hair."
  end
end

namespace :afternoon do
  task :make_coffee do
    Rake::Task['morning:make_coffee'].invoke
    puts "Ready for the rest of the day."
  end
end


