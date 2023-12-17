# frozen_string_literal: true

task default: %w[test]

desc "Run tests"
task :test do
  ruby "-Itest main.rb"
end

desc "Add Git hooks"
task :local_setup do
  sh "scripts/local-setup.sh"
end

desc "Check format"
task :check_format do
  bundle exec "rufo -c ."
end

desc "Check style"
task :check_style do
  bundle exec "rubocop **/**/*.rb"
end

desc "Reformat code"
task :reformat do
  bundle exec "rufo ."
end

desc "Run precommit"
task pre_commit: %i[test check_style check_format]
