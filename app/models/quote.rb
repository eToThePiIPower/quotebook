class Quote < ApplicationRecord
  belongs_to :user

  validates :source, presence: true
  validates :text, presence: true
end
