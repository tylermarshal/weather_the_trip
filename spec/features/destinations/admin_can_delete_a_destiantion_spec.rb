require 'rails_helper'

describe "user visits destinations index page" do
  context "as an admin" do
    it "allows admin to delete destination" do
      admin = create(:user, role: 1)
      destination = create(:destination)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit destinations_path

      expect(page).to have_content("Destinations")

      click_on "Delete"
      expect(current_path).to eq(destinations_path)
    end
  end
  context "as a default user" do
    it "does not allow default user to see admin delete button on destination index" do
      user = create(:user)
      destination = create(:destination)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit destinations_path

      expect(page).to_not have_content("Delete")
    end
  end
end
