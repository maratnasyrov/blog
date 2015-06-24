class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :articles

  validates :full_name, presence: true

  has_attached_file :image_profile,
    :styles => { :medium => "300x300#"},
    :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image_profile, :content_type => /\Aimage\/.*\Z/

  def to_s
    full_name
  end

  def full_name_with_email
    "#{self[:full_name]} (#{email})"
  end
end
