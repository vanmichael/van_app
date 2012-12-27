module ProfileHelper
#Return the user's profile URL.
def about_for(user)
	url_for(:controller => 'profile', :action => 'show', :screen_name => user.screen_name)
end

def profile_for(user)
	url_for(@user)
end

#Return true if hiding the edit links for spec, etc.
def hide_edit_links?
	not @hide_edit_links.nil?
end

end
