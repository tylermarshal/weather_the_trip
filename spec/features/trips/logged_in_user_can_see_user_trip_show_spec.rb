require "rails_helper"

describe "a user can see the trip show page" do
  context "a user logs in" do
    context "a user visits trip show page" do
      it "creates a a new trip" do
        user = create(:user)
        trip = create(:trip, user_id: user.id)
        destination = Destination.create(city: "Denver", state: "CO", latitude: 39.7392358, longitude: -104.990251, population: 649495)
        Route.create(destination_id: destination.id, trip_id: trip.id)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit user_trip_path(user,trip)

        expect(page).to have_content("#{destination.city}")
        expect(page).to have_content("#{destination.state}")

      end
    end
  end
end
