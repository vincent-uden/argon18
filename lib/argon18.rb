require 'sinatra'
require 'slim'
require 'rack'

require 'server/app.rb'

class Argon
  def self.run_app(project_root)
    ENV['project_root'] = File.expand_path(project_root)
    ENV['views_path'] = "views"
    ArgonApp.config

    Dir.chdir(ENV['project_root']) do
      Rack::Handler::WEBrick.run(ArgonApp, Port: 9292)
    end
  end
end
