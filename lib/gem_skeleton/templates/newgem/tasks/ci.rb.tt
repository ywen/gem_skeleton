begin
  require 'rspec/core'
  require 'rspec/core/rake_task'

  require 'cane/rake_task'
  task :ci => [
    'cruise_spec',
    'quality'
  ]

  desc "Run cane to check quality metrics"
  Cane::RakeTask.new(:quality) do |cane|
    cane.abc_max = 10
    cane.no_doc = true
  end
  desc "Run all specs in spec directory (excluding plugin specs)"
  RSpec::Core::RakeTask.new(:cruise_spec) do |t|
    out = File.join(File.expand_path(File.dirname(__FILE__)), "..","test_reports/Rspec.html")
    t.rspec_opts = ["--format", "html", "-o", out, "--format", "progress"]
    excluded_paths = ['bundle', 'spec', 'config/boot.rb', '/var/', '/usr']
    t.pattern = "spec/**/*_spec.rb"
  end
rescue LoadError => e
end
