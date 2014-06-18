class Post < ActiveRecord::Base
	belongs_to :group, :counter_cache => true
	validates :content, :presence => true

	belongs_to :author, :class_name => "User", :foreign_key => :user_id
 
	def editable_by?(user)
		user && user == author
	end

	def index
		@groups = current_user.participated.order("posts_count DESC")
	end
	
end
