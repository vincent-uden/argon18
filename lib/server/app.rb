class ArgonApp < Sinatra::Base
  def self.config
    configure do
      set :root, ENV['project_root']
      set :views, ENV['views_path']
    end
  end

  get '/' do
    slim :index
  end
end
