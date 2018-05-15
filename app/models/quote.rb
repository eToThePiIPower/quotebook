class Quote < ApplicationRecord
  validates :source, presence: true
  validates :text, presence: true
end
