class Comment < ApplicationRecord
  belongs_to :article

  validates :body, presence: true
  validates :author_id, presence: true

  def abuse!
  	self.abuse_count+= 1 
  	self.save
  end 

  def overabused?
     self.destroy if self.abuse_count > 3
  end

  def author?(user)
    self.author_id == user.id
  end
  
end
