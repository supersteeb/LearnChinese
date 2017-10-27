class WordsTested < ApplicationRecord
  belongs_to :tests
  belongs_to :words
end
