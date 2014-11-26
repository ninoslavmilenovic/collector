class Chunk < ActiveRecord::Base
  belongs_to :user

  validates :content, :public_ip, :private_ip, presence: true
  validates :public_ip, :private_ip, format: { :with => Resolv::IPv4::Regex }

  scope :bundles, -> { Array(all.group_by { |chunk| chunk.created_at.to_date }) }
  scope :bundle, ->(date) { where(['created_at >= ? AND created_at < ?', date, date + 1.day]) }
end
