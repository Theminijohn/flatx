class Listing < ActiveRecord::Base

  #Tags (Acts_as_taggable gem)
  acts_as_taggable

  # A Listing belogs to ONE User
  belongs_to :user
  belongs_to :category


  # Validations
  validates :description, :presence => true

  validates :title, :presence => true, length: { minimum: 15, maximum: 40 }

  validates :user_id, :presence => true

  validates :category_id, :presence => true

  # Paperclip (must be before validates_attachment)
  has_attached_file :image, styles: { medium: "320x240>"},
    path: ":rails_root/public/system/:attachment/:id/:style/:filename",
    url:  "/system/:attachment/:id/:style/:filename"

  validates_attachment :image, presence: true,
    content_type: {
    content_type: ['image/jpeg', 'image/jpg', 'image/png']
  }, size: { less_than: 5.megabytes }
end
