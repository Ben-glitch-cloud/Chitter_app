feature 'creating a new account' do
    scenario 'as a new user' do
        visit('/')
        fill_in 'username', with: 'Victoria' 
        fill_in 'password', with: 'Test'  
        click_button 'Sign Up' 
        expect(page).to have_content 'Log In'
    end 
end 

feature 'log In' do
    scenario 'as a user' do
        visit('/')
        fill_in 'username', with: 'Victoria' 
        fill_in 'password', with: 'Test'  
        click_button 'Sign Up' 
        fill_in 'username', with: 'Victoria' 
        fill_in 'password', with: 'Test'
        click_button 'Log In' 
        expect(page).to have_content 'New Chitter' 
        expect(page).to have_content 'Log out'
    end
end  

feature 'Log In error' do
    scenario 'if the user types in the wrong password or username' do
        visit('/log_in') 
        fill_in 'username', with: ''
        fill_in 'password', with: ''
        click_button 'Log In' 
        expect(page).to have_content "Your Username or Password is incorrect"
    end
end 

feature 'New Chitter' do
    scenario 'created by the user' do
        visit('/chitter') 
        click_link 'New Chitter' 
        fill_in 'chit', with: 'Hello World' 
        click_button'Submit'  
        expect(page).to have_content "New Chitter\nLog out\nHello World\n#{Time.new.strftime("%d/%m/%Y")}"
    end
end 

feature 'Delete' do
    scenario 'chit from chitter' do
        visit('/chitter') 
        click_link 'New Chitter' 
        fill_in 'chit', with: 'Hello World' 
        click_button'Submit' 
        click_button 'Delete' 
        expect(page).to have_no_content "New Chitter\nLog out\nHello World\n#{Time.new.strftime("%d/%m/%Y")}"
    end
end