class User < ActiveRecord::Base
  has_secure_password

  has_many :ratings
  has_many :restaurants, through: :ratings
  has_many :comments

  validates :email, uniqueness: true
  validates :name, presence: true
end
