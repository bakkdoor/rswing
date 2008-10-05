Gem::Specification.new do |s|
   s.name = "rswing"
   s.summary = "RSwing - Ruby-ish wrapper of Swing GUI-Framework for JRuby"
   s.description = %q{RSwing is a wrapper of the Swing GUI-Framework of the Java Platform for JRuby. The goal is to provide a ruby-ish wrapper library to Swing, which makes it feel
   more like an actual ruby library rather than just a plain interface to the java classes.}
   s.version = "0.1.0"
   s.date = "2008-10-05"
   s.author = "Christopher Bertels"
   s.email = "bakkdoor@flasht.de"
   s.homepage = "http://github.com/bakkdoor/rswing"
   s.has_rdoc = true
   s.files = [ "README", "LICENSE", "Rakefile", "lib/rswing.rb", "lib/gui/components/*.rb", "lib/gui/components/events/*.rb" ]
   s.test_files = []
   s.extra_rdoc_files = ["README"]
   s.rdoc_options = ["--main", "README"]
   s.requirements << 'none'
   s.require_path = 'lib'
end
