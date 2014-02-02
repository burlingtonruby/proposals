require 'digest/md5'

class User < ActiveRecord::Base
  devise

  has_many :proposals

  validates :name, presence: true
  validates :email, presence: true, on: :update
  validates :bio, presence: true, on: :update
  validates :photo, attachment_presence: true, on: :update

  Paperclip.interpolates :secret_key do |attachment, style|
    Digest::MD5.hexdigest(attachment.instance.photo_file_name)
  end

  if Rails.env.production?
    has_attached_file :photo,
        styles: { large: '600x600', medium: '300x300', small: '100x100' },
        path: "photos/:id/:style/:secret_key.:extension"
  else
    has_attached_file :photo,
        styles: { large: '600x600', medium: '300x300', small: '100x100' }
  end

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

  # Used by ActiveAdmin/Devise to allow Oauth login only
  def password_required?
    false
  end

  def to_s
    name
  end
end
