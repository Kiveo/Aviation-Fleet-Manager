class User < ActiveRecord::Base
  has_many :planes
  has_secure_password

  def slug
    self.username.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    User.all.detect {|user| user.slug == slug}
  end
  
end
