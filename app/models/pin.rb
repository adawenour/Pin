require 'open-uri'

class Pin < ActiveRecord::Base
	belongs_to :user

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

	
	validates :image, presence: true

  validates :description, presence: true

  #Image Uploading via URL
  #rails generate migration AddImageRemoteUrlToPins image_remote_url:string
   #rake db:migrate
    #add image_remote_url into controller params as well.
  def image_remote_url=(url_value)
    self.image = URI.parse(url_value) unless url_value.blank?
    super
  end

end
