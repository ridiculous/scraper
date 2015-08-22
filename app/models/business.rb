class Business < ActiveRecord::Base
  validates :name, uniqueness: true
end
