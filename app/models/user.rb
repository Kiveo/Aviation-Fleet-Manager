class User < ActiveRecord::Base
  has_many :planes 
  has_secure_password
end
