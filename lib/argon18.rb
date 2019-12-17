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

  def self.gen_static_html(project_root)
    ENV['project_root'] = File.expand_path(project_root)
    ENV['views_path'] = "views"
    Dir.chdir(ENV['project_root']) do
      files = []
      dir_stack = []
      dir_stack = dir_stack + Dir.children(ENV['views_path'])
      p dir_stack

      while !dir_stack.empty?
        curr_dir = dir_stack.first
      end
    end
  end
end
