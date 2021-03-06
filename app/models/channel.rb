class Channel < ApplicationRecord

  validates :channel_name,
            :owner_id,
            :stream_name,
            :banner_image_url,
            presence: true

  validates :channel_name,
            uniqueness: true

  before_validation :ensure_default_channel_name,
                    :ensure_stream_name,
                    :ensure_default_banner_image

  belongs_to :owner,
    class_name: "User",
    primary_key: :id,
    foreign_key: :owner_id

  def self.featured_channels
    Channel.where.not(video_url: :null).limit(8)
  end

  def self.featured_channel
    # Selects random num fron playing channel count and then selects first result.
    playing_channels = Channel.where.not(video_url: :null)
    playing_channels.offset(rand(playing_channels.count)).first
  end

  private

  def ensure_default_channel_name
    self.channel_name ||= self.owner.username
  end

  def ensure_stream_name
    self.stream_name ||= "#{self.channel_name}'s Stream"
  end

  def ensure_default_banner_image
    self.banner_image_url ||= "http://res.cloudinary.com/zwitch/image/upload/v1500511693/zwitch_default_banner_img_vtrk3t.jpg"
  end

end
