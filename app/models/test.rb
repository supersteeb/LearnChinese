class Test < ApplicationRecord
	has_many :words_tested
  has_many :words, :through => :words_tested
  
end
