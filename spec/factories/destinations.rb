FactoryBot.define do
  factory :destination do
    city "San Francisco"
    state "CA"
    latitude 37.7749295
    longitude (-122.4194155)
    population 837442
    # sequence(:city) {|n| "City#{n}"}
    # sequence(:state) {|n| "State#{n}"}
    # sequence(:latitude) {|n| n}
    # sequence(:longitude) {|n| n}
    # sequence(:population) {|n| n}
  end
end
