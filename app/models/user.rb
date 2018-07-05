class User < ActiveRecord::Base
  has_many :stocks
  has_many :sectors, through: :stocks
end
