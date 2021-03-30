require 'pg'


class Chitters_app  

    attr_reader :id, :mes, :sent_time

    def initialize(id: nil, mes: nil, sent_time: nil) 

        @id = id  

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
            Chitters_app.new(id: chitter['id'], mes: chitter['mes'], sent_time: chitter['sent_time'])
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
end