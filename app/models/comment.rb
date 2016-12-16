class Comment < ApplicationRecord
  belongs_to :article

  validates :body, presence: true
  validates :author_id, presence: true

  def overabused?
  	self.destroy if self.abuse_count > 3
  end 
end
