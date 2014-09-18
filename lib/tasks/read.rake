desc 'Read Gemfile'
task :read => :environment do
  contents = $stdin.read
  # @project = Project.new.parse(contents)
  @project = Project.new(title: "My Project" )
  warn "Parsing Contents"
  @project.parse(contents)
  warn "Attaching Gems"
  @project.attach_gems
  project_gems = @project.ruby_gems.each do |gem|
    puts gem.name
    puts gem.info
    puts "========" * 5
  end

  #FIXME: fix the code to make gem name & info print
  # project_gems.each do |gem|
  #   @project.get_gem_info(gem)
  #   puts @gem_name
  #   puts @gem_info
  # end
end

#$stdin.puts
#warn
