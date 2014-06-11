class Course < ActiveRecord::Base
  has_attached_file :image, :styles => { medium: "690x450>", thumb: "200x200>" }
  validates :name, :description, :brief_description, :starts_at, :ends_at, presence: true
  validates_attachment :image, presence:true, :content_type => { content_type: "image/jpeg" }
end