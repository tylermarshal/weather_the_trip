require 'rails_helper'

describe "When a user visits the destinations index page" do
  it "A user sees the attributes of all destinations" do
    destination_1 = create(:destination)

    visit destinations_path

    expect(page).to have_content("Destinations")
    expect(page).to have_content(destination_1.city)
    expect(page).to have_content(destination_1.state)
  end
end
