require 'sinatra/base'   
require './lib/Chitter_app_account.rb'
require './lib/Chitter_app.rb'


class Chitter < Sinatra::Base 
    
    get '/' do   
        chitters = Chitters_app.new 
        @chitters = chitters.store   
        erb :'index'
    end  

    get '/sign_up' do
        erb :'sign_up'
    end  

    post '/saving_sign_up' do 
        chitter_account = Chitter_account.new
        username = params['username'] 
        password = params['password'] 
        chitter_account.new_account(username, password)   
        redirect '/'
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