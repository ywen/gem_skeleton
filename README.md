# GemSkeleton

This gem provide a command for making a rubygem skeleton.

It basically copied from ```bundle gem``` code and add some more templates and here is extra file list:

* .rvmrc (which is ignored in .gitignore)
* .rvmrc.template
* .gemspec file: This is not new, But I add rspec related gems and code quality control gems:
    * rspec
    * guard-spork
    * guard-rspec
    * cane
    * simplecov
    * growl-rspec

## Installation

Add this line to your application's Gemfile:

    gem 'gem_skeleton'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gem_skeleton

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
