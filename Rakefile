require "rake"
require "rake/testtask"
require "rake/rdoctask"
require "rake/clean"
require "rake/gempackagetask"
 
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