# frozen_string_literal: true

class PhysicalAddress < ApplicationRecord
  validates :address_1, presence: true
  validates :city, presence: true
  validates :state_province, presence: true
  validates :postal_code, presence: true
  validates :country, presence: true

  belongs_to :location
  belongs_to :link_instance
end
