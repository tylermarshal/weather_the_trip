require 'rails_helper'

describe "user visits destinations new page" do
  context "as an admin" do
    it "allows admin to create destinations" do
      admin = create(:user, role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_destination_path

      expect(page).to have_content("Admin - Create Destination")

      fill_in "destination[city]", with: "Pawnee"
      fill_in "destination[state]", with: "IN"
      fill_in "destination[latitude]", with: 35.0000001
      fill_in "destination[longitude]", with: 65.0000001
      fill_in "destination[population]", with: 114123

      click_on "Create Destination"

      last_destination = Destination.last

      expect(current_path).to eq(destination_path(last_destination))
    end
  end
  context "as a default user" do
    it "does not allow default user to see admin create destinations page" do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit new_admin_destination_path

      expect(page).to_not have_content("Admin - Create Destination")
      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
