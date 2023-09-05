task default: %w[test]

task :test do
  ruby "test/test_suite.rb"
end

task :local_setup do
  sh "scripts/local-setup.sh"
end

task :check_format do
  bundle exec "rufo -c ."
end

task :reformat do
  bundle exec "rufo ."
end

task pre_commit: [:check_format, :test]
