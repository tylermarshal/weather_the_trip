require "rails_helper"

describe "a user visits a destination show page" do
  it "a user sees all attributes of a destination show page" do
    destination = create(:destination)

    visit destination_path(destination)

    expect(current_path).to eq("/destinations/#{destination.id}")

    expect(page).to have_content(destination.city)
    expect(page).to have_content(destination.state)
    expect(page).to have_content(destination.longitude)
    expect(page).to have_content(destination.latitude)
    expect(page).to have_content(destination.population)
  end
end
