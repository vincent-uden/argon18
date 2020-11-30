require 'sinatra'
require 'slim'
require 'rack'
require 'fileutils'

require 'server/app.rb'

class SlimEnv
  attr_accessor :name
end

class Argon
  def self.run_app(project_root)
    ENV['project_root'] = File.expand_path(project_root)
    ENV['views_path'] = "views"
    ArgonApp.config

    Dir.chdir(ENV['project_root']) do
      Rack::Handler::WEBrick.run(ArgonApp, {Port: 9292, BindAddress: '0.0.0.0'})
    end
  end

  def self.gen_static_html(project_root)
    ENV['project_root'] = File.expand_path(project_root)
    ENV['views_path'] = "views"
    ENV['public_path'] = "public"
    ENV['output_path'] = ENV['project_root'] + "/" + "output/"

    FileUtils.mkdir_p ENV['output_path']

    Dir.chdir(ENV['project_root']) do
      files = []
      dir_stack = [ENV['views_path']]
      p dir_stack

      slim_env = SlimEnv.new
      slim_env.name = "Argon18"
      # Copy media
      FileUtils.cp_r "#{ENV['public_path']}/.", ENV['output_path']

      # Render slim files
      while !dir_stack.empty?
        curr_dir = (dir_stack.delete_at 0).split("views/")[-1]
        FileUtils.mkdir_p (ENV['output_path'] + curr_dir)
        Dir[curr_dir + "/*"].each { |d| dir_stack << d }
        dir_stack.filter! { |f| File.directory? f }

        files = Dir[curr_dir + "/*.slim"]
        p files
        files.each do |f|
          content = File.read f
          parsed = Slim::Template.new { content }.render(slim_env)
          parsed = parsed.gsub(/href="\/"/, 'href="index.html"')
          parsed = parsed.gsub(/href="([^".]+)"/, 'href="\1.html"')
          base_name = f.split(".")[0].split("views/")[-1]
          File.write ENV['output_path'] + base_name + ".html", parsed
        end
      end
    end
  end
end
