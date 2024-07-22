# frozen_string_literal: true

require_relative "lib/bancos_brasileiros/version"

Gem::Specification.new do |spec|
  spec.name = "bancos_brasileiros"
  spec.version = BancosBrasileiros::VERSION
  spec.authors = ["Elton Santos"]
  spec.email = ["eltonaxl@hotmail.com"]
  spec.summary = "🇧🇷 🏦 📋 Brazilian commercial banks list"
  spec.description = "🇧🇷 🏦 📋 Brazilian commercial banks list"
  spec.homepage = "https://github.com/eltonsantos/bancos_brasileiros"
  spec.required_ruby_version = ">= 2.6.0"
  spec.license = "MIT"

  spec.metadata = {
    "homepage_uri" => spec.homepage,
    "source_code_uri" => "https://github.com/eltonsantos/bancos_brasileiros",
    "changelog_uri" => "https://github.com/eltonsantos/bancos_brasileiros/blob/master/CHANGELOG.md",
  }

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
