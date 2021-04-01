require 'pg' 

def setup_test_database
    p "setting up test database" 
    connection = PG.connect(dbname: 'chitter_manager_test') 
    connection.exec("TRUNCATE message, account;") 
end 
