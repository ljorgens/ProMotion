unless defined?(Motion::Project::Config)
  raise "The ProMotion gem must be required within a RubyMotion project Rakefile."
end

require 'motion_print'

Motion::Project::App.setup do |app|
  app.files.flatten!
  core_lib = File.join(File.dirname(__FILE__), 'ProMotion')
  insert_point = app.files.find_index { |file| file =~ /^(?:\.\/)?app\// } || 0

  Dir.glob(File.join(core_lib, '**/*.rb')).reverse.each do |file|
    app.files.insert(insert_point, file)
  end

end
