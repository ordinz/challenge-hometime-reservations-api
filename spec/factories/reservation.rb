FactoryBot.define do
  factory :reservation do
    reservation_code { Faker::Alphanumeric.alpha(number: 8).upcase }
    start_date { Faker::Date.between(from: 1.year.ago, to: 1.year.from_now) }
    end_date { Faker::Date.between(from: start_date, to: 1.year.from_now) }
    nights { (end_date - start_date).to_i }
    guests { Faker::Number.between(from: 1, to: 10) }
    adults { Faker::Number.between(from: 1, to: guests) }
    children { Faker::Number.between(from: 0, to: [0, guests - adults].max) }
    infants { Faker::Number.between(from: 0, to: [0, guests - adults - children].max) }
    status { %w[pending confirmed cancelled].sample }
    currency { %w[USD EUR AUD GBP].sample }
    payout_price { Faker::Number.decimal(l_digits: 2) }
    security_price { Faker::Number.decimal(l_digits: 2) }
    total_price { payout_price + security_price }
    guest
  end
end