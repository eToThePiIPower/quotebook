class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :quotes, dependent: :destroy
  has_one :profile, dependent: :destroy

  validates :username, length: { minimum: 5 }
  validates :username, presence: true
  validates :username, uniqueness: { case_sensitive: false }

  def profile
    super || Profiles::DefaultProfile
  end
end
