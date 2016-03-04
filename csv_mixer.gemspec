Gem::Specification.new do |s|
  s.name               = "csv_mixer"
  s.version            = "0.0.1"
  s.default_executable = "csv_mixer"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["M Renardus"]
  s.date = %q{2016-03-03}
  s.description = %q{Operations on CSV files}
  s.email = %q{miker.renardus@gmail.com}
  s.files = ["Rakefile", "lib/csv_mixer.rb", "lib/csv_mixer/translator.rb", "bin/csv_mixer"]
  s.test_files = ["test/test_csv_mixer.rb"]
  s.homepage = %q{http://rubygems.org/gems/csv_mixer}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{CSV mixer}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

