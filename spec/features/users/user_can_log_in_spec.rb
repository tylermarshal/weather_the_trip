require 'rails_helper'

describe "a user logs in" do
  context "a user visits the root" do
    context "a user clicks the login button" do
      context "u user fills out the form and logs in" do
        it "a user is logged in" do
          user = create(:user)

          visit "/"

          all(".top-nav-links")[3].click

          fill_in "username", with: user.username
          fill_in "password", with: user.password

          first(".submit-button").click

          expect(page).to have_content("Welcome, #{user.username}!")
        end
      end
    end
  end
end
