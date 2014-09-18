desc 'Read Gemfile'
task :read => :environment do
  contents = $stdin.read
  # @project = Project.new.parse(contents)
  @project = Project.new(title: "My Project" )
  @project.parse(contents)
  output = @project.attach_gems
  puts output
end
