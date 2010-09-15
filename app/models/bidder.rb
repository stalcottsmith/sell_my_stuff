class Bidder < ActiveRecord::Base
  
  has_many :bids
  has_many :items, :through => :bids
  
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :phone

end
