class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  
  validates :title, presence: true
  validates :description, presence: true
  
  after_destroy :notify

  def count_comments
    self.comments.count
  end

  def author?(user)
    self.user_id == user.id
  end
  
  private 

  def notify
    self.comments.uniq { |c| c.author_id }.each do |comment|
      NotificationMailer.article_removed(c.author).deliver
    end
  end
end
