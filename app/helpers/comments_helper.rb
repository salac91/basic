module CommentsHelper
	def authors_name(id)
	  User.find(id).name
	end
end
