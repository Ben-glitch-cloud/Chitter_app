require 'pg'  

class Chitter_account   

    def new_account(username, password)
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_manager_test')
        else
            connection = PG.connect(dbname: 'chitter_manager')
        end    

        result = connection.exec("SELECT username FROM account WHERE username LIKE '#{username}%';")  
        result.each do |item| 
            p item 
            if item['username'] == username 
                return "null" 
            elsif item['password'] == ""
                return "nill"
            else 
                connection.exec("INSERT INTO account (username, password) VALUES ('#{username}', '#{password}');") 
            end  
        end 
    end    

    def verify_login(username, password)
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_manager_test')
        else
            connection = PG.connect(dbname: 'chitter_manager')
        end 
        result = connection.exec("SELECT username, password FROM account WHERE username = '#{username}' AND password = '#{password}';")  
    end 

end 