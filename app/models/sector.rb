class Sector < ActiveRecord::Base
  has_many :stocks
  has_many :users 
end
