class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :article

  validates :text, presence: true

  def time
    self.created_at = created_at.strftime("%I:%M %p %b %d, %Y")
  end
end
