class Plane < ActiveRecord::Base
  belongs_to :user

  def slug
    self.identifier.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    Plane.all.detect{|plane| plane.slug == slug }
  end

end
