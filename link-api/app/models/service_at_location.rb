class ServiceAtLocation < ApplicationRecord
  belongs_to :link_instance
  belongs_to :service
  belongs_to :location
end
