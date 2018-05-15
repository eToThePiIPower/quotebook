class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :quotes, dependent: :destroy
  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile

  after_initialize do
    build_profile if new_record? && profile.blank?
  end

  validates :username, length: { minimum: 5 }
  validates :username, presence: true
  validates :username, uniqueness: { case_sensitive: false }
end
