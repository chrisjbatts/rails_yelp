class Restaurant < ActiveRecord::Base

	belongs_to :user
  has_many :reviews, dependent: :destroy
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "thumb/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :name, length: { minimum: 3 }, uniqueness: true

  def average_rating
  	return 'N/A' if reviews.none?
  	reviews.average(:rating)
  end
  
end 
