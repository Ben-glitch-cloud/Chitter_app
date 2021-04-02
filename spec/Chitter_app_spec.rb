require './lib/Chitter_app.rb' 

describe Chitters_app do
    describe 'add' do  
        it 'a new chitter to the Chitter app' do
            chitter = Chitters_app.new 
            p chitter.add('Hello World', '01/01/2021')
            
        end 
    end 
end