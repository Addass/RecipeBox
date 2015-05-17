class Favourite < ActiveRecord::Base
	belongs_to :user
	has_many :recipes, :through => :user
end
