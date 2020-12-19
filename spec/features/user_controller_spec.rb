require 'rails_helper.rb'
describe 'User Controller', :type => :features do

    it "can sign up" do
        visit '/users/new'
        expect(current_path).to eq('/users/new')
        user_signup
        expect(current_path).to eq('/')
        expect(page).to have_content("Mike")
        expect(page).to have_content("My Page")
        expect(page).to have_content("Logout")
    end
end 