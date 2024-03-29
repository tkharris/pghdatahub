class SearchController < ApplicationController

  def home
  end

  def search
  	query = params[:q]
  	url = "http://ec2-54-226-133-156.compute-1.amazonaws.com:8983/solr/select?q=docs:#{CGI.escape(query)}&wt=json"
  	puts url
  	response = HTTParty.get(url)
	#puts response.body, response.code, response.message, response.headers.inspect
	@search_result = ActiveSupport::JSON.decode(response.body)['response']
	puts @search_result
	@search_result['docs'].each do |r|
		puts r
	end
  	respond_to do |format|
  		format.html
  		format.json { render :json => @search_result }
  	end
  end

end
