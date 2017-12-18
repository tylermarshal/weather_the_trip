require 'rails_helper'

describe "a user can sign up" do
  context "a user visits the root" do
    context "a user clicks the sign up button" do
      context "a user fills out the form and signs up" do
        it "a new user account is created" do
          visit "/"

          all(".top-nav-links").last.click

          expect(current_path).to eq(new_user_path)

          fill_in "user[username]", with: "roadtripper"
          fill_in "user[password]", with: "wegotsnacks&supplies"

          click_on "Create User"

          expect(page).to have_content("Welcome, roadtripper")
        end
      end
    end
  end
end
