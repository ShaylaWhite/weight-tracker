class User < ActiveRecord::Base
    has_secure_password
 
    validates :name, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
  
    has_many :stats
 end
 