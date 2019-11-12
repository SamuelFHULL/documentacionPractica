require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)
task :default=> :spec

desc "Pruebas unitarias para el fichero alimentos.rb"
task :spec do
	sh "ruby -I. spec/alimentos_spec.rb"
end

desc "Ejecutar solo las pruebas simples"
task :simple do
	sh "ruby -I. spec/alimentos_spec.rb -n /simple/"
end
