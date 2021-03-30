require 'sinatra/base'  
require './lib/Chitter_app.rb'


class Chitter < Sinatra::Base 
    
    get '/' do   
        chitters = Chitters_app.new 
        @chitters = chitters.store   
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

    post '/delete/:user_id' do
        chitter = Chitters_app.new  
        user_id = params[:user_id] 
        chitter.delete(user_id) 
        redirect '/'
    end
end