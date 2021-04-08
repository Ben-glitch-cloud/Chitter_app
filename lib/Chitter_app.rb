require 'pg' 


class Chitters_app  

    attr_reader :user_id, :mes, :sent_time, :id

    def initialize(user_id: nil, mes: nil, sent_time: nil, id: nil)  

        @id = id

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
            Chitters_app.new(user_id: chitter['message_id'], mes: chitter['mes'], sent_time: chitter['sent_time'], id: chitter['id'])
        end   
    end 

    def add(chit, timing, id)
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_manager_test')
        else
            connection = PG.connect(dbname: 'chitter_manager')
        end  
        connection.exec("INSERT INTO message (mes, sent_time, id) VALUES ('#{chit}', '#{timing}', '#{id}');") 
    end  

    def delete(user_id)
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_manager_test')
        else
            connection = PG.connect(dbname: 'chitter_manager')
        end 
        connection.exec("DELETE FROM message WHERE message_id ='#{user_id}';") 
    end 
end