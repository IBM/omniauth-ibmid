require_relative "lib/omniauth-ibmid/version"

Gem::Specification.new do |spec|
  spec.name = "omniauth-ibmid"
  spec.version = OmniAuth::Ibmid::VERSION
  spec.authors = ["Michael Lin"]
  spec.email = ["mlzc@hey.com"]

  spec.summary = "IBMid strategy for OmniAuth"
  spec.description = "IBMid strategy for OmniAuth"
  spec.homepage = "https://github.com/ibm/omniauth-ibmid"
  spec.license = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] =
    "https://github.com/ibm-skills-network/omniauth-ibmid"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files =
    Dir.chdir(File.expand_path(__dir__)) do
      `git ls-files -z`.split("\x0").reject do |f|
        f.match(%r{^(test|spec|features)/})
      end
    end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "omniauth", [">= 1.9", "< 3"]
  spec.add_dependency "omniauth-oauth2", ">= 1.4"

  spec.add_development_dependency "bundler", ">= 2.0"
  spec.add_development_dependency "prettier", ">= 1.5.5"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", ">= 3.0"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "webmock"
end
