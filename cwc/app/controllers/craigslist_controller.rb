class CraigslistController < ApplicationController
	def new
		@results = Craigslist.newhaven.missed_connections.fetch(50)
		@text = @results[1]["text"]
	end
end
