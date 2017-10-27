class Word < ApplicationRecord
	has_many :words_tested
	has_many :tests, :through => :words_tested

	validates :character, presence: true, uniqueness: {case_sensitive: false}
	validates :meaning, presence: true

	def self.search(search)
		where("character LIKE ? OR meaning LIKE ? OR pinyin LIKE ? OR part_of_speech LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
		#where("character LIKE ?", "%#{search}%")
		#where("pinyin LIKE ?", "%#{search}%")
		#where("part_of_speech LIKE ?", "%#{search}%")
	end

end
