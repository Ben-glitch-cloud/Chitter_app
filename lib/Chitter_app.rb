require 'pg'


class Chitters_app
    
    def store
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_manager_test')
        else
            connection = PG.connect(dbname: 'chitter_manager')
        end 
        result = connection.exec("SELECT * FROM message;")
        result.map do |chitter|
            chitter['mes']
        end  
    end 

    def add(chit)
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_manager_test')
        else
            connection = PG.connect(dbname: 'chitter_manager')
        end  
        connection.exec("INSERT INTO message (mes) VALUES ('#{chit}');")
    end 
end