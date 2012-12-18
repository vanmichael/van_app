module GamesHelper
	def show_icon_for(icon, size_version_key)
		@icon = Icon.find_by_id(icon)
		image_tag @icon.image_url(size_version_key).to_s
	end

	def show_image(icon, size_version_key)
		image_tag(icon.image_url(size_version_key).to_s, :class => "game_icons", :data => {:icon_id => icon.id})
	end

	def current_game=(game)
		@current_game = game
	end

	def current_game
		@current_game ||= Game.find_by_id(params[:game_id], :joins => [{ :pools => :user}])
	end

	def current_game?(game)
		game == current_game
	end
end
