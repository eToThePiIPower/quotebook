class Quote < ApplicationRecord
  validates_presence_of :source
  validates_presence_of :text
end
