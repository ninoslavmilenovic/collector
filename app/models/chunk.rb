class Chunk < ActiveRecord::Base
  belongs_to :user

  validates :content, :public_ip, :private_ip, presence: true
  validates :public_ip, :private_ip, format: { with: Resolv::IPv4::Regex }
end
