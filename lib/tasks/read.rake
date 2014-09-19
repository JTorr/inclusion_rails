desc 'Read Gemfile'
task :read => :environment do
  contents = $stdin.read
  @project = Project.new(title: "My Project" )
  warn "Parsing Contents"
  @project.parse(contents)
  warn "Attaching Gems"
  @project.attach_gems
  project_gems = @project.ruby_gems.each do |gem|
    puts gem.name
    puts gem.info
    puts "=====" * 15
  end
end
