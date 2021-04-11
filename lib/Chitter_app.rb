require 'pg' 


class Chitters_app  

    attr_reader :user_id, :mes, :sent_time, :account_id, :id_comment, :comment, :message_id, :account_id_comments, :account_id_like, :message_id_like, :like_count 

    def initialize(user_id: nil, mes: nil, sent_time: nil, account_id: nil, id_comment: nil, comment: nil, message_id: nil, account_id_comments: nil, account_id_like: nil, message_id_like: nil, like_count: nil)  

        @account_id = account_id

        @user_id = user_id  

        @mes = mes  

        @sent_time = sent_time 

        @id_comment = id_comment 

        @comment = comment 

        @message_id = message_id 

        @account_id_comments = account_id_comments 

        @account_id_like = account_id_like 

        @message_id_like = message_id_like 

        @like_count = like_count

    end 
    
    def store
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_manager_test')
        else
            connection = PG.connect(dbname: 'chitter_manager')
        end 
        result = connection.exec("SELECT * FROM message;")
        result.map do |chitter|
            Chitters_app.new(user_id: chitter['message_id'], mes: chitter['mes'], sent_time: chitter['sent_time'], account_id: chitter['account_id'])
        end   
    end 

    def add(chit, timing, id)
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_manager_test')
        else
            connection = PG.connect(dbname: 'chitter_manager')
        end  
        connection.exec("INSERT INTO message (mes, sent_time, account_id) VALUES ('#{chit}', '#{timing}', '#{id}');") 
    end  

    def delete(user_id)
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_manager_test')
        else
            connection = PG.connect(dbname: 'chitter_manager')
        end  

        connection.exec("DELETE FROM message WHERE message_id = '#{user_id}';")  
        connection.exec("DELETE FROM comments WHERE message_id = '#{user_id}';")
    end  

    def add_comment(comment, message_id, account_id)
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_manager_test')
        else
            connection = PG.connect(dbname: 'chitter_manager')
        end 

        connection.exec("INSERT INTO comments(comment, message_id, account_id) VALUES ('#{comment}', '#{message_id}', '#{account_id}');")  
    end  

    def stored_comments
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_manager_test')
        else
            connection = PG.connect(dbname: 'chitter_manager')
        end 
        
        result = connection.exec("SELECT * FROM comments;")

        result.map do |comment|   
            Chitters_app.new(id_comment: comment['id_comment'], comment: comment['comment'], message_id: comment['message_id'], account_id_comments: comment['account_id'])
        end 
    end  

    def delete_comment(comment) 
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_manager_test')
        else
            connection = PG.connect(dbname: 'chitter_manager')
        end 

        connection.exec("DELETE FROM comments WHERE id_comment = '#{comment.to_i}';")
    end   
    
    def stored_likes 
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_manager_test')
        else
            connection = PG.connect(dbname: 'chitter_manager')
        end 

        result = connection.exec("SELECT * FROM like_count_table;") 

        result.map do |like_peep|  
            Chitters_app.new(account_id_like: like_peep['account_id'], message_id_like: like_peep['message_id'],like_count: like_peep['like_count'])
        end 
    end 

    def like_button(account_id, message_id) 
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_manager_test')
        else
            connection = PG.connect(dbname: 'chitter_manager')
        end 

        result = connection.exec("SELECT like_count FROM like_count_table WHERE account_id = '#{account_id}' AND message_id = '#{message_id}';")  

        if result.first.to_json == 'null' 
            connection.exec("INSERT INTO like_count_table(account_id, message_id, like_count) VALUES ('#{account_id}', '#{message_id}', '1');") 
            else 
            result.map do |item| 
                if item['like_count'] == "1"  
                    connection.exec("INSERT INTO like_count_table(account_id, message_id, like_count) VALUES ('#{account_id}', '#{message_id}', '-1');") 
                else  item['like_count'] == "-1"
                    connection.exec("INSERT INTO like_count_table(account_id, message_id, like_count) VALUES ('#{account_id}', '#{message_id}', '1');") 
                end 
            end 
        end
    end 
end