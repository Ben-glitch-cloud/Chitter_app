require './lib/Chitter_app.rb' 

describe Chitters_app do 
    describe 'store' do  

        let(:chitter) {Chitters_app.new}

        it 'chitters in table' do
            connection = PG.connect(dbname: 'chitter_manager_test') 
            connection.exec("INSERT INTO message (mes, sent_time) VALUES('Hello world', '01/01/2021');") 
            connection.exec("INSERT INTO message (mes, sent_time) VALUES('Whats up', '01/01/2021');") 
            connection.exec("INSERT INTO message (mes, sent_time) VALUES('Having a good time', '01/01/2021');") 
        end 
    end
end