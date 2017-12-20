require "rails_helper"

describe "a user visits user trip index page while logged in" do
  context "a user logs in" do
    context "a user visits trip index page" do
      context "a user enters a name and submits" do
        it "creates a a new trip" do
          user = create(:user)
          trip = create(:trip, user_id: user.id)

          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

          visit user_trips_path(user)

          expect(current_path).to eq("/users/#{user.id}/trips")
          expect(page).to have_content(trip.name)

        end
      end
    end
  end
end
