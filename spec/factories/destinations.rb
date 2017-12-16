FactoryBot.define do
  factory :destination do
    name "San Francisco"
    # sequence(:name) {|n| "Destination#{n}"}
    # sequence(:city) {|n| "City#{n}"}
    # sequence(:state) {|n| "State#{n}"}
    # sequence(:latitude) {|n| n}
    # sequence(:longitude) {|n| n}
  end
end
