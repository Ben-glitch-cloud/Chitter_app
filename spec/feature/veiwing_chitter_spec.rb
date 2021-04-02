
feature 'New Chitter' do
    scenario 'created by the user' do
        visit('/chitter') 
        click_link 'New Chitter' 
        fill_in 'chit', with: 'Hello World' 
        click_button 'Submit'  
        expect(page).to have_content "New Chitter\nLog out\nHello World\n#{Time.new.strftime("%d/%m/%Y")}"
    end 
end  



feature 'Delete Chitter' do
    scenario 'from chitter' do
        visit('/chitter') 
        click_link 'New Chitter' 
        fill_in 'chit', with: 'Whats up' 
        click_button 'Submit' 
        click_button 'Delete' 
        expect(page).to have_no_content "Whats up"
    end
end