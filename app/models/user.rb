class User < ActiveRecord::Base
  has_many :proposals

  validates :name, presence: true
  validates :email, presence: true, on: :update

  has_attached_file :photo, styles: { large: '600x600', medium: '300x300', small: '100x100' }
  validates_attachment :photo,
      content_type: { content_type: ["image/jpeg", "image/jpg", "image/gif", "image/png"] },
      size: { in: 0..10.megabytes }

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end

  def to_s
    name
  end
end
