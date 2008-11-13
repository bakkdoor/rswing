require 'rubygems'
require "rake"
require "rake/testtask"
require "rake/rdoctask"
require "rake/clean"
require "rake/gempackagetask"
require 'echoe'
 
task :default => [ :test ]
task :test    => [ :test_units ]
  
desc "run unit tests in test/unit"
rt = Rake::TestTask.new("test_units") do |t|
  t.libs << "test/unit"
  t.pattern = "test/test_*.rb"
  t.verbose = true
end

desc "create rdoc in /doc"
rd = Rake::RDocTask.new("doc") do |rd|
  rd.main = "README"
  rd.rdoc_files.include("README", "lib/*.rb")
  rd.options << "--all"
  rd.rdoc_dir = "rdoc"
end

# echoe-related stuff for building gem & gemspec.

Echoe.new('rswing', '0.2.3') do |p|
  p.description    = %q{RSwing is a wrapper of the Swing GUI-Framework of the Java Platform for JRuby. The goal is to provide a ruby-ish wrapper library to Swing, which makes it feel more like an actual ruby library rather than just a plain interface to the java classes.}
  p.summary        = "RSwing - Ruby-ish wrapper of Swing GUI-Framework for JRuby"
  p.url            = "http://github.com/bakkdoor/rswing"
  p.author         = "Christopher Bertels"
  p.email          = "bakkdoor@flasht.de"
  p.ignore_pattern = ["doc/*"]
  p.development_dependencies = []
end

#Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }
