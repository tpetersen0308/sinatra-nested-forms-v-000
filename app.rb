require './environment'

module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here
    get '/' do
      erb :index
    end
    
    get '/new' do
      erb :create_new
    end
    
    post '/pirates' do
      @pirate = Pirate.new(params[:pirate])
      params[:pirate][:ships].each do |ship|
        Ship.new(ship)
      end
      
      @ships = Ship.all
      
      erb :display_new
    end
  end
end
