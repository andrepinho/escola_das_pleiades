class New < ActiveRecord::Base
  has_attached_file :image, :styles => { medium: "690x450>", thumb: "200x200>" }
  validates :title, :content, :ordering, :headline, :publish_at, presence: true
  validates :ordering, numericality: {greater_than_or_equal_to: 0, less_than: 4}
  validates_attachment :image, presence:true, :content_type => { content_type: "image/jpeg" }

  def self.published
    where(["publish_at <= ?", Time.now]).order('publish_at DESC')
  end

  def self.home
    published.where("ordering > 1").order(:ordering).limit(2)
  end
  def self.super_new
    published.where("ordering = 1").first
  end
end
