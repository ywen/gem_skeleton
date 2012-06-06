require 'bundler/vendored_thor'
require 'rubygems/user_interaction'
require 'rubygems/config_file'

module GemSkeleton
  class CLI < Thor
    include Thor::Actions
    check_unknown_options!

    default_task :make

    class << self
      def source_root
        File.expand_path(File.join(File.dirname(__FILE__), 'templates'))
      end

    end

    desc "make GEM", "Creates a skeleton for creating a rubygem"
    long_desc <<-D
      Make a gem skeleton, with rspec goodies, tasks for settingup ci,
      a Guardfile, a .rvmrc.template, etc.
    D
    method_option :bin, :type => :boolean, :default => false, :aliases => '-b', :banner => "Generate a binary for your library."
    def make(name)
      name = name.chomp("/") # remove trailing slash if present
      target = File.join(Dir.pwd, name)
      constant_name = name.split('_').map{|p| p[0..0].upcase + p[1..-1] }.join
      constant_name = constant_name.split('-').map{|q| q[0..0].upcase + q[1..-1] }.join('::') if constant_name =~ /-/
      constant_array = constant_name.split('::')
      FileUtils.mkdir_p(File.join(target, 'lib', name))
      git_user_name = `git config user.name`.chomp
      git_user_email = `git config user.email`.chomp
      opts = {
        :name           => name,
        :constant_name  => constant_name,
        :constant_array => constant_array,
        :author         => git_user_name.empty? ? "TODO: Write your name" : git_user_name,
        :email          => git_user_email.empty? ? "TODO: Write your email address" : git_user_email
      }
      template(File.join("newgem/Gemfile.tt"),               File.join(target, "Gemfile"),                opts)
      template(File.join("newgem/Rakefile.tt"),              File.join(target, "Rakefile"),               opts)
      template(File.join("newgem/LICENSE.tt"),               File.join(target, "LICENSE"),                opts)
      template(File.join("newgem/README.md.tt"),             File.join(target, "README.md"),              opts)
      template(File.join("newgem/gitignore.tt"),             File.join(target, ".gitignore"),             opts)
      template(File.join("newgem/Guardfile.tt"),             File.join(target, "Guardfile"),              opts)
      template(File.join("newgem/rvmrc.tt"),                 File.join(target, ".rvmrc"),              opts)
      template(File.join("newgem/rvmrc.tt"),                 File.join(target, ".rvmrc.template"),      opts)
      template(File.join("newgem/rspec.tt"),                 File.join(target, ".rspec"),      opts)
      template(File.join("newgem/newgem.gemspec.tt"),        File.join(target, "#{name}.gemspec"),        opts)
      template(File.join("newgem/lib/newgem.rb.tt"),         File.join(target, "lib/#{name}.rb"),         opts)
      template(File.join("newgem/spec/spec_helper.rb.tt"), File.join(target, "spec/spec_helper.rb"), opts)
      template(File.join("newgem/tasks/rspec.rake.tt"), File.join(target, "tasks/rspec.rake"), opts)
      template(File.join("newgem/tasks/ci.rake.tt"), File.join(target, "tasks/ci.rake"), opts)
      if options[:bin]
        template(File.join("newgem/bin/newgem.tt"),          File.join(target, 'bin', name),              opts)
      end
      puts "Initializating git repo in #{target}"
      Dir.chdir(target) { `git init`; `git add .` }
    end
  end
end
