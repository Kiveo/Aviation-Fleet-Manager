class Plane < ActiveRecord::Base
  belongs_to :user

  validates :identifier, presence: true
  validates :identifier, uniqueness: true
  validates :serial_number, uniqueness: true
end
