# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "markdpwn"
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Victor Costan"]
  s.date = "2012-02-22"
  s.description = "HTML-formats text documents such as Markdown, textile, and source code"
  s.email = "victor@costan.us"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.markdown"
  ]
  s.files = [
    ".document",
    ".project",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.markdown",
    "Rakefile",
    "VERSION",
    "lib/markdpwn.rb",
    "lib/markdpwn/code.rb",
    "lib/markdpwn/docs.rb",
    "lib/markdpwn/dpwn.rb",
    "lib/markdpwn/glue.rb",
    "lib/markdpwn/red_carpet_renderer.rb",
    "markdpwn.gemspec",
    "test/fixtures/readme.asciidoc",
    "test/fixtures/readme.md",
    "test/fixtures/readme.pod",
    "test/fixtures/readme.rdoc",
    "test/fixtures/readme.rst",
    "test/fixtures/readme.textile",
    "test/fixtures/readme.wiki",
    "test/fixtures/view.html.erb",
    "test/helper.rb",
    "test/markdpwn/code_test.rb",
    "test/markdpwn/docs_test.rb",
    "test/markdpwn/dpwn_test.rb",
    "test/markdpwn_test.rb"
  ]
  s.homepage = "http://github.com/pwnall/markdpwn"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.16"
  s.summary = "HTML-formats text documents such as Markdown, textile, and source code"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<pygments.rb>, [">= 0.2.4"])
      s.add_runtime_dependency(%q<github-markup>, [">= 0.7.1"])
      s.add_runtime_dependency(%q<redcarpet>, [">= 2.1.0"])
      s.add_runtime_dependency(%q<RedCloth>, [">= 4.2.9"])
      s.add_runtime_dependency(%q<rdoc>, [">= 3.12"])
      s.add_runtime_dependency(%q<creole>, [">= 0.4.2"])
      s.add_runtime_dependency(%q<wikicloth>, [">= 0.7.1"])
      s.add_development_dependency(%q<minitest>, [">= 2.11"])
      s.add_development_dependency(%q<yard>, [">= 0.7"])
      s.add_development_dependency(%q<bundler>, [">= 1.0.22"])
      s.add_development_dependency(%q<jeweler>, [">= 1.8.3"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
    else
      s.add_dependency(%q<pygments.rb>, [">= 0.2.4"])
      s.add_dependency(%q<github-markup>, [">= 0.7.1"])
      s.add_dependency(%q<redcarpet>, [">= 2.1.0"])
      s.add_dependency(%q<RedCloth>, [">= 4.2.9"])
      s.add_dependency(%q<rdoc>, [">= 3.12"])
      s.add_dependency(%q<creole>, [">= 0.4.2"])
      s.add_dependency(%q<wikicloth>, [">= 0.7.1"])
      s.add_dependency(%q<minitest>, [">= 2.11"])
      s.add_dependency(%q<yard>, [">= 0.7"])
      s.add_dependency(%q<bundler>, [">= 1.0.22"])
      s.add_dependency(%q<jeweler>, [">= 1.8.3"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<simplecov>, [">= 0"])
    end
  else
    s.add_dependency(%q<pygments.rb>, [">= 0.2.4"])
    s.add_dependency(%q<github-markup>, [">= 0.7.1"])
    s.add_dependency(%q<redcarpet>, [">= 2.1.0"])
    s.add_dependency(%q<RedCloth>, [">= 4.2.9"])
    s.add_dependency(%q<rdoc>, [">= 3.12"])
    s.add_dependency(%q<creole>, [">= 0.4.2"])
    s.add_dependency(%q<wikicloth>, [">= 0.7.1"])
    s.add_dependency(%q<minitest>, [">= 2.11"])
    s.add_dependency(%q<yard>, [">= 0.7"])
    s.add_dependency(%q<bundler>, [">= 1.0.22"])
    s.add_dependency(%q<jeweler>, [">= 1.8.3"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<simplecov>, [">= 0"])
  end
end

