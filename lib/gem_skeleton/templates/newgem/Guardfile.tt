guard 'spork' do
  watch('Gemfile')
  watch('Gemfile.lock')
  watch('spec/spec_helper.rb') { :rspec }
end

guard 'rspec', :all_after_pass => false, :cli => "--color --format documentation --drb" do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)/(.+)\.rb$})     { |m| [ "lib/#{m[1]}/#{m[2]}.rb", "spec/#{m[1]}/#{m[2]}_spec.rb" ] }
  watch('spec/spec_helper.rb')  { "spec" }
end
