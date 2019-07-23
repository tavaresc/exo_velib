# This will guess the Station class

FactoryBot.define do
  factory :station do
    id_number { 2089 }
    name { "46 - SAINT LAZARE" }
    latitude { 48.876930 }
    longitude { 2.334900 }
    available_stands { [1, 5] }
  end

=begin
  sequence :station_mock do |n|
    id_number { n }
    name { "#{n} - STATION-#{n}" }
    latitude { n }
    longitude { n + 1.1234 }
    available_stands { [n, n + 1] }
  end
=end
end