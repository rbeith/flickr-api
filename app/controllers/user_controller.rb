class UserController < ApplicationController
	require 'flickr'

	def index
		@user_name = params[:user_id]
		
		flickr = Flickr.new ENV['flickr_api_key'], ENV['flickr_secret']
		
		begin
			@flickr_user_id = flickr.people.findByUsername(:username => @user_name)
			@photos = flickr.photos.search(:user_id => @flickr_user_id.id, :privacy_filter => 1, :per_page => 10, :page => 1)
		rescue => exception
			
		end
	end
end
