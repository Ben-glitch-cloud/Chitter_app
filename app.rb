require 'sinatra/base'    
require 'sinatra/flash' 
require 'pg'
require './lib/Chitter_app_account.rb'
require './lib/Chitter_app.rb'


class Chitter < Sinatra::Base  

    enable :sessions, :method_override 

    register Sinatra::Flash
    
    get '/chitter' do     
        @array = [] 

        chitters = Chitters_app.new 
        @chitters = chitters.store     
        @comments = chitters.stored_comments 
        @like = chitters.stored_likes     
        @id = session[:id]  
        erb :'index'
    end  

    get '/' do
        erb :'sign_up'
    end   

    post '/saving_sign_up' do 
        chitter_account = Chitter_account.new  

        if params['username'] == "" || params['password'] == ""  
            flash[:notice] = "You must create a username or password" 
            redirect '/'  
        end 
        
        result = chitter_account.new_account(username = params['username'] , password = params['password']) 
        
        if result == "null"  
            flash[:notice] = "Sorry this username has been taken" 
            redirect '/' 
        end   
        redirect '/log_in' 
    end 

    get '/log_in' do
        erb :'log_in'
    end  

    post '/verification' do 
        chitter_account = Chitter_account.new
        result = chitter_account.verify_login(username = params[:username], password = params[:password])  
        
        id = 0
        chitter = chitter_account.account_id(username = params[:username])  
        chitter.each { |item| session[:id] = id += item.id.to_i} 
        #this is where the id comes out.  
        
        array = []
        result.each { |item| array << [item['username'], item['password']] } 
            if result.first.to_json == "null" 
                flash[:notice] = "Your Username or Password is incorrect"
                redirect '/log_in' 
            elsif array.flatten[0].length == 0 && array.flatten[1].length == 0
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
        chitters.add(chit = params[:chit], timing = Time.new.strftime("%d/%m/%Y"), id = session[:id])
        redirect '/chitter'
    end 

    delete '/delete/:user_id' do
        chitter = Chitters_app.new  
        chitter.delete(user_id = params[:user_id]) 
        redirect '/chitter'
    end 

    get '/comment/:id/:account_id' do 
        chitter = Chitters_app.new   
        chitter.add_comment(comment = params[:comment], message_id = params[:id], account_id = params[:account_id])  
        redirect '/chitter'
    end 

    delete '/delete_comment/:comment_id' do
        chitter = Chitters_app.new   
        chitter.delete_comment(comment = params[:comment_id])
        redirect '/chitter'
    end 

    post '/like_button/:account_id/:message_id' do 
        chitter = Chitters_app.new 
        chitter.like_button(params[:account_id], params[:message_id])
        redirect '/chitter'
    end
end