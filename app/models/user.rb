class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :articles
  has_many :comments

  validates :full_name, presence: true

  has_attached_file :image_profile,
    :styles => { :medium => "300x300#", :thumb => "52x52#", :mini => "25x25#", :average => "100x100#"},
    :default_url => ":style/missing_profile_photo.png"
  validates_attachment_content_type :image_profile, :content_type => /\Aimage\/.*\Z/

  def to_s
    full_name
  end

  def full_name_with_email
    "#{self[:full_name]} (#{email})"
  end

  def articles_number
    articles.size
  end

  def comments_number
    comments.size
  end
end
