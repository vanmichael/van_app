module UsersHelper

	# Return the Gravatar (not-used currently)
	def gravatar_for(user, options = { size: 50 })
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		size = options[:size]
		gravatar_url = "http://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
		image_tag(gravatar_url, alt: user.name, class: "gravatar")
	end

	# Return Profile Pic
	def profile_pic_for(user, size_version_key)
		if user.image.blank?
		image_tag "rails.png"
		else
		image_tag user.image_url(size_version_key).to_s
		end
	end
end
