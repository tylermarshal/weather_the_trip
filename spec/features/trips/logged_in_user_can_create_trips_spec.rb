require "rails_helper"

describe "a user creates a trip while logged in" do
  context "a user logs in" do
    context "a user visits trip new page" do
      context "a user enters a name and submits" do
        it "creates a a new trip" do
          user = create(:user)

          visit "/"

          all(".top-nav-links")[3].click

          fill_in "username", with: user.username
          fill_in "password", with: user.password

          first(".submit-button").click

          expect(current_path).to eq(user_path(user))

          all(".top-nav-links")[3].click

          expect(current_path).to eq(new_user_trip_path(user))

          fill_in "name", with: "Trip 1"

          first(".submit-button").click

        end
      end
    end
  end
end
