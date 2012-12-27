module UsersHelper

	# Return the Gravatar (not-used currently)

	def full_name(user)
		user.first_name + " " + user.last_name
	end

	def gravatar_for(user, options = { size: 50 })
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		size = options[:size]
		gravatar_url = "http://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
		@first_name = user.first_name
		@last_name = user.last_name
		@name = @first_name + @last_name
		image_tag(gravatar_url, alt: @name, class: "gravatar")
	end

	# Return Profile Pic
	def profile_pic_for(user, size_version_key)
		if user.image.blank?
		image_tag "rails.png"
		else
		image_tag user.image_url(size_version_key).to_s, :id => 'profile'
		end
	end
end
