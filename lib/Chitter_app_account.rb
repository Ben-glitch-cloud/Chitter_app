require 'pg'  

class Chitter_account   
    
    attr_reader :id
    
    def initialize(id: nil) 

        @id = id

    end 

    def new_account(username, password)
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_manager_test')
        else
            connection = PG.connect(dbname: 'chitter_manager')
        end    
       
        result = connection.exec("SELECT username FROM account WHERE username LIKE '#{username}%';")  
        result.each { |item| return 'null' if item['username'] == username }  
        
        connection.exec("INSERT INTO account (username, password) VALUES ('#{username}', '#{password}');") 
    end     


    def verify_login(username, password)
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_manager_test')
        else
            connection = PG.connect(dbname: 'chitter_manager')
        end  

        result = connection.exec("SELECT username, password FROM account WHERE username = '#{username}' AND password = '#{password}';")   

    end 

    def account_id(username) 
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_manager_test')
        else
            connection = PG.connect(dbname: 'chitter_manager')
        end   
        result_id = connection.exec("SELECT id FROM account WHERE username = '#{username}'")   
        
        result_id.map do |item|
            Chitter_account.new(id: item['id'])
        end
    end  

end 