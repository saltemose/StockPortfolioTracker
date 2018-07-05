class Sector < ActiveRecord::Base
  has_many :stocks
  has_manuy :users 
end
