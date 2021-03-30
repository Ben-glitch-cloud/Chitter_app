require 'sinatra/base'  
require './lib/Chitter_app.rb'


class Chitter < Sinatra::Base 
    
    get '/' do   
        chitters = Chitters_app.new 
        @chitters = chitters.store   
        p @chitters
        erb :'index'
    end 

    get '/new' do
        erb :'new'
    end 

    post '/new_chitter' do 
        chitters = Chitters_app.new
        chit = params[:chit]   
        time = Time.new 
        timing = time.strftime("%d/%m/%Y")
        chitters.add(chit, timing)
        redirect '/'
    end
end