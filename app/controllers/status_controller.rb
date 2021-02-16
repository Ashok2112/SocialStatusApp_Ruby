require 'net/http'
class StatusController < ApplicationController
  URLS = ["https://takehome.io/twitter", "https://takehome.io/facebook", "https://takehome.io/instagram"].freeze

	def index
	  body = call_social_apis
	  respond_to do |format|
        format.html  { render :json => body }
        format.json  { render :json => body }
      end
	end

private
	def call_social_apis
	  body = {}
	  keys = ['twitter' , 'facebook', 'instagram']
	  URLS.each_with_index do |social, i|
		begin
		  uri = URI(social)
		  http = Net::HTTP.new(uri.host, uri.port)
		  http.use_ssl = true

		  response = Net::HTTP.get_response(uri)
		  body[keys[i]] = JSON.parse(response.body)
		rescue 
		  puts 'Unwanted exception occured.'
		end
	  end
	  body
	end

end
