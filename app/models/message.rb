class Message < ActiveRecord::Base
  validates :body, :presence => true, :length => { :maximum => 100 }
  
  belongs_to :board

  def self.message_list
    return Message.all.order(:created_at => :desc)
  end
end

