class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  scope :desc_sort, -> { order('updated_at DESC') }
  scope :private_articles, -> { where(privacy: 'true') }

  has_attached_file :image, :styles => { :medium => "595x595>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
