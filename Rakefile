require 'rubygems'
require 'rake'
require 'rake/clean'
require 'rake/packagetask'
require 'rake/gempackagetask'
require 'rake/rdoctask'
require 'rake/contrib/rubyforgepublisher'
require 'fileutils'
require 'hoe'
include FileUtils
require File.join(File.dirname(__FILE__), 'lib', 'newgem', 'version')

AUTHOR = "Dr Nic Williams"
EMAIL = "drnicwilliams@gmail.com"
DESCRIPTION = "Make your own gems at home"
GEM_NAME = "newgem" # what ppl will type to install your gem
RUBYFORGE_PROJECT = "newgem"
HOMEPATH = "http://#{RUBYFORGE_PROJECT}.rubyforge.org"

REV = nil #File.read(".svn/entries")[/committed-rev="(\d+)"/, 1] rescue nil
VERSION = ENV['VERSION'] || (Newgem::VERSION::STRING + (REV ? ".#{REV}" : ""))
CLEAN.include ['**/.*.sw?', '*.gem', '.config']
RDOC_OPTS = ['--quiet', '--title', "newgem documentation",
    "--opname", "index.html",
    "--line-numbers", 
    "--main", "README",
    "--inline-source"]

# Generate all the Rake tasks
# Run 'rake -T' to see list of generated tasks (from gem root directory)
hoe = Hoe.new(GEM_NAME, VERSION) do |p|
  p.author = AUTHOR 
  p.description = DESCRIPTION
  p.email = EMAIL
  p.summary = DESCRIPTION
  p.url = HOMEPATH
  p.rubyforge_name = RUBYFORGE_PROJECT if RUBYFORGE_PROJECT
  p.test_globs = ["test/**/test*.rb"]
  p.clean_globs = CLEAN  #An array of file patterns to delete on clean.

  # == Optional
  #p.changes        - A description of the release's latest changes.
  p.extra_deps = ['hoe']  #An array of rubygem dependencies.
  #p.spec_extras    - A hash of extra values to set in the gemspec.
end

