class Profile < ApplicationRecord
  belongs_to :user

  validates :about_me,
    presence: true,
    length: { minimum: 6 }
  validates :location,
    length: { minimum: 6 }
  validates :home_page,
    length: { minimum: 6 }
end
