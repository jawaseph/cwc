class CraigslistController < ApplicationController
	def new
		@results = Craigslist.newhaven.missed_connections.fetch(5)
		@results
	end
end
