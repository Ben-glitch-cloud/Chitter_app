require 'sinatra/base'    
require 'sinatra/flash'
require './lib/Chitter_app_account.rb'
require './lib/Chitter_app.rb'


class Chitter < Sinatra::Base  

    enable :sessions
    
    get '/chitter' do   
        chitters = Chitters_app.new 
        @chitters = chitters.store   
        erb :'index'
    end  

    get '/' do
        erb :'sign_up'
    end   

    post '/saving_sign_up' do 
        chitter_account = Chitter_account.new
        chitter_account.new_account(username = params['username'] , password = params['password'])   
        redirect '/log_in'
    end 

    get '/log_in' do
        erb :'log_in'
    end  

    post '/verification' do 
        chitter_account = Chitter_account.new
        result = chitter_account.verify_login(username = params[:username], password = params[:password]  )    
        if result.first.to_json == "null"  
            # flash[:notice] = 'Username or Password is incorrect'
            redirect '/log_in'
        else 
            redirect '/chitter'
        end
    end


    get '/new' do
        erb :'new'
    end 

    post '/new_chitter' do 
        chitters = Chitters_app.new
        time = Time.new 
        chitters.add(chit = params[:chit], timing = time.strftime("%d/%m/%Y"))
        redirect '/chitter'
    end 

    post '/delete/:user_id' do
        chitter = Chitters_app.new  
        chitter.delete(user_id = params[:user_id]) 
        redirect '/chitter'
    end
end