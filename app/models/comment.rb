class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user

  validates :body, presence: true
  validates :user_id, presence: true
  validates :article_id, presence: true

  def abuse!
  	self.abuse_count+= 1 
  	self.save
  end 

  def overabused?
     self.destroy if self.abuse_count > 3
  end

  def author?(user)
    self.user_id == user.id
  end
  
end
