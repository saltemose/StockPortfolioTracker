class Stock < ActiveRecord::Base
  belongs_to :sector
  has_many :users
end
