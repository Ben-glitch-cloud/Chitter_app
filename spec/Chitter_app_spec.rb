require './lib/Chitter_app.rb' 

describe Chitters_app do
    describe 'store' do  
        it 'Chitters in the main app' do
            chitter = Chitters_app.new 
            chitter.add('Hello World', '01/01/2021')
            chitter.store.each do |chitter|  
                expect(chitter.mes).to include('Hello World') 
                expect(chitter.sent_time).to include('01/01/2021')
            end 
        end 
    end   
    
    describe 'add' do
        it 'a new Chitter to the app' do
            chitter = Chitters_app.new 
            chitter.add('Hello Chitter', '02/03/2021') 
            chitter.add('Whats going here', '02/03/2021') 
            chitter.add('Building tests', '02/03/2021') 
            expect(chitter.store.map { |chitter| chitter.mes} ).to eq(["Hello Chitter", "Whats going here", "Building tests"])
        end
    end  
end