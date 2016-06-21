class Board < ActiveRecord::Base
  validates :title, :presence => true, :length => { :maximum => 10 }
  
  has_many :messages
end
