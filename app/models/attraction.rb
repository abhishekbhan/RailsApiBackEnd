class Attraction < ActiveRecord::Base
	belongs_to :vacation
	has_many :photos
end
