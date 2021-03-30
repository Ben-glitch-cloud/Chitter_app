require 'pg'


class Chitters_app  

    attr_reader :user_id, :mes, :sent_time

    def initialize(user_id: nil, mes: nil, sent_time: nil) 

        @user_id = user_id  

        @mes = mes  

        @sent_time = sent_time

    end 
    
    def store
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_manager_test')
        else
            connection = PG.connect(dbname: 'chitter_manager')
        end 
        result = connection.exec("SELECT * FROM message;")
        result.map do |chitter|
            Chitters_app.new(user_id: chitter['user_id'], mes: chitter['mes'], sent_time: chitter['sent_time'])
        end   
    end 

    def add(chit, timing)
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_manager_test')
        else
            connection = PG.connect(dbname: 'chitter_manager')
        end  
        connection.exec("INSERT INTO message (mes, sent_time) VALUES ('#{chit}', '#{timing}');") 
    end  

    def delete(user_id)
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_manager_test')
        else
            connection = PG.connect(dbname: 'chitter_manager')
        end 
        connection.exec("DELETE FROM message WHERE user_id ='#{user_id}';") 
    end 
end