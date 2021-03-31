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

    def verify_login(username, password)
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_manager_test')
        else
            connection = PG.connect(dbname: 'chitter_manager')
        end 
        result = connection.exec("SELECT username, password FROM account WHERE username = '#{username}' AND password = '#{password}';")  
        p result.first.to_json
        result.each do |info|
            p info["username"] 
            p info["password"] 
        end
    end 

end 