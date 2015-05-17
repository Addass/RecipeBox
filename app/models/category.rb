class Category < ActiveRecord::Base
	has_many :recipes

	validates :name, :desc, presence: true
end
