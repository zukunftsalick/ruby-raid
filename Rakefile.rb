require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'


#Task para gerar a documentacao automaticamente
Rake::RDocTask.new do |rd|
   rd.main = "README.rdoc"
   rd.rdoc_files.include("README.rdoc", "enemies/**/*.rb", "train.rb", "game_window.rb")
end

task :run do 
	ruby "game_window.rb"
end

