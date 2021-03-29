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
end