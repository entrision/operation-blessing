class Photo < ActiveRecord::Base
  mount_uploader :url, PhotosUploader

  validates :url, presence: true
  validates :prayer, presence: true
  validates :for_date, presence: true
  validates :location, presence: true

  scope :sort_by_date, ->{ order('for_date desc') }
end
