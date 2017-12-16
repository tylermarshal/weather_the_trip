require 'rails_helper'

describe "When a user visits the destinations index page" do
  it "A user sees the attributes of all destinations" do
    destination_1 = create(:destination)
    require "pry"; binding.pry

    expect(page).to have_content("Destination1")
  end
end
