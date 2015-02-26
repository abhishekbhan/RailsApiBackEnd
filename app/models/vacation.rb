class Vacation < ActiveRecord::Base
	belongs_to :user
	has_many :attractions

	validates :name, presence: true
	validates :description, presence: true
end
