require 'sinatra/base'    
require 'sinatra/flash' 
require 'pg'
require './lib/Chitter_app_account.rb'
require './lib/Chitter_app.rb'


class Chitter < Sinatra::Base  

    enable :sessions, :method_override 

    register Sinatra::Flash
    
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
        result = chitter_account.new_account(username = params['username'] , password = params['password'])  
        p 'find error'   
        p result
        redirect '/log_in'
    end 

    get '/log_in' do
        erb :'log_in'
    end  

    post '/verification' do 
        chitter_account = Chitter_account.new
        p result = chitter_account.verify_login(username = params[:username], password = params[:password]  )     
        array = []
        result.each { |item| array << [item['username'], item['password']] } 
            if result.first.to_json == "null" 
                flash[:notice] = "Your Username or Password is incorrect"
                redirect '/log_in' 
            elsif array.flatten == ["", ""]  
                flash[:notice] = "There's nothing here:(" 
                redirect '/log_in'
            end  
        redirect '/chitter'
    end


    get '/new' do
        erb :'new'
    end 

    post '/new_chitter' do 
        chitters = Chitters_app.new
        chitters.add(chit = params[:chit], timing = Time.new.strftime("%d/%m/%Y"))
        redirect '/chitter'
    end 

    delete '/delete/:user_id' do
        chitter = Chitters_app.new  
        chitter.delete(user_id = params[:user_id]) 
        redirect '/chitter'
    end
end