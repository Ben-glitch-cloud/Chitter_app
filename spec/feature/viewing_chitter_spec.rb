feature 'Chitters' do
    scenario 'A list of sent Chitters' do
        visit '/' 
        expect(page).to have_content('This is the first message') 
        expect(page).to have_content('Weather is looking good tomorrow 22 degress') 
        expect(page).to have_content('This is the first project use SQL')
    end
end