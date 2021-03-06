# frozen_string_literal: true

FactoryBot.define do
  factory :physical_address do
    link_instance
    location
    attention 'Some Entity'
    address_1 '123 Some Street'
    city 'San Francisco'
    region 'San Francisco County'
    state_province 'CA'
    postal_code '12345'
    country 'United State'
  end
end
