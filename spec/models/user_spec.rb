require 'rails_helper'

describe User do
  it "can be created as an admin" do
    user = create(:user, role: 1)

    expect(user.role).to eq("admin")
    expect(user.admin?).to be_truthy
  end
end
