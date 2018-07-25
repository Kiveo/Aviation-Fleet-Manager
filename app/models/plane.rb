class Plane < ActiveRecord::Base
  belongs_to :user

  validates :identifier, presence: true
  validates :identifier, uniqueness: true
  validates :serial_number, uniqueness: true

  def slug
    identifier.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    Plane.all.detect {|plane| plane.slug == slug}
  end

end
