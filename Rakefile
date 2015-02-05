require("sinatra/activerecord")
require("sinatra/activerecord/rake")

namespace(:db) do
  task(:load_config) do
    require('./app.rb')
  end
  namespace :test do
    task :prepare => :environment do
      Rake::Task["db:seed"].invoke
    end
  end
end
