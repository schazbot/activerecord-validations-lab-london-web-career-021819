class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-fiction)}
  validate :clickbait


private
  def clickbait
  clickbait = /Won't Believe|Secret|Top\d+|Guess/i
    if clickbait.match(title) == nil
      errors.add(:title, 'Title must be clickbaity')
    end
  end

end
