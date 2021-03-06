class Ad < ActiveRecord::Base
  belongs_to :category
  belongs_to :member

  #Validates
  validates :title,:description, :category, :price, :picture, :finish_date, presence:true
  validates :price, numericality: {greater_than: 0}

  # paperclip config
  has_attached_file :picture, styles: { medium: "320x150#", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  #Scopes
  scope :descending_order, ->(quantity = 10) { limit(quantity).order(created_at: :desc) }
  scope :to_the, ->(member) { where(member: member).order(created_at: :desc) }

  # gem money-rails
  monetize :price_cents

end
