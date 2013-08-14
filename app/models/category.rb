class Category < ActiveRecord::Base

	has_many :listings

	# For overriding URL to show Name and not ID of the Category
	def to_param
		name
	end

end
