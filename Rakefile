task default: %w[test]

task :test do
  ruby "spec/test_suite.rb"
end

task :local_setup do
  sh "scripts/local-setup.sh"
end

task :build do
  sh "docker build . -t aoc"
end

task :check_format do
  sh "docker run -it --entrypoint rufo aoc -c ."
end

multitask pre_commit: [:check_format, :test]
