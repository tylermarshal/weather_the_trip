FactoryBot.define do
  factory :destination do
    sequence(:city) {|n| "City#{n}"}
    sequence(:state) {|n| "State#{n}"}
    sequence(:latitude) {|n| n}
    sequence(:longitude) {|n| n}
    sequence(:population) {|n| n}
  end
end
