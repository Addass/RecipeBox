class Recipe < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	
	has_many :ingredients
	has_many :directions
	has_many :favourites_recipes #Dodane jak cos usunac
	has_many :favourited_by, through: :favourites_recipes, source: :user #Dodane jak cos usunac
	validates :title, :description, :image, presence: true
	has_attached_file :image, styles: { :medium => "400x400#" }
	validates_attachment_content_type :image, content_type:/\Aimage\/.*\Z/


	accepts_nested_attributes_for :ingredients,
								reject_if: proc { |attributes| attributes['name'].blank? },
								allow_destroy: true
 	accepts_nested_attributes_for :directions,
								reject_if: proc { |attributes| attributes['step'].blank? },
								allow_destroy: true


	def self.search(search)
	  	if search
	  		@temp = where(user_id: User.where(email: search))
	    	if !@temp.present?
	    		where("title LIKE ?", search)
	    	else
	    		@temp
	    	end
		else
			all
	  	end
	end
end