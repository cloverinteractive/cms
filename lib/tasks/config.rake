namespace :config do
  desc "Generate application environtment files"
  task :generate => [ :vhost, :database ]

  desc "Generate nginx vhost"
  task :vhost do
    erb_parse :vhost
  end


  desc "Generate database.yml"
  task :database do
    erb_parse :database, extension: '.yml'
  end

  def erb_parse name, opts={}
    require 'erb'
    ext = opts[:extension] || '.conf'

    host = {
      'development' => 'www.cms.dev',
      'production'  => 'www.cloverinteractive.com',
      'staging'     => 'staging.cloverinteractive.com'
    }[ Rails.env ]

    config_dir = Rails.root.join( 'config' ).to_s
    
    erb_env = Proc.new do
      @host = host
      @root = Rails.root

      @subdomain  = host.split( '.' ).first
      @public     = "#{ @root.join 'public' }"
      @log        = "#{ @root.join 'log' }"
      @dev_on     = Rails.env.production? ? 'off' : 'on'

      binding
    end.call

    response = ERB.new File.read( File.join( config_dir, "_#{ name }#{ ext }.erb" ) )
    
    File.open File.join( config_dir, "#{ name }#{ ext }" ), 'w' do |f|
      f.print response.result( erb_env )
    end
  end
end
