require 'pg' 

class Chitter_account   

    def new_account(username, password)
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_manager_test')
        else
            connection = PG.connect(dbname: 'chitter_manager')
        end  
        connection.exec("INSERT INTO account (username, password) VALUES ('#{username}', '#{password}');")
    end   

end 