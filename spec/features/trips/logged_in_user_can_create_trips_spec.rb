require "rails_helper"

describe "a user creates a trip while logged in" do
  context "a user logs in" do
    context "a user visits trip new page" do
      context "a user enters a name and submits" do
        it "creates a a new trip" do
          user = create(:user)

          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

          visit new_user_trip_path(user)

          fill_in "trip[name]", with: "Trip 1"

          first(".submit-button").click

          last_trip = Trip.last

          expect(current_path).to eq(user_trip_path(user, last_trip))

        end
      end
    end
  end
end
