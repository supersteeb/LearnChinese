class CalendarController < ApplicationController

	def index
	  @articles = Article.all
	  @articles_by_date = @articles.group_by(&:published_on)
	  @date = params[:date] ? Date.parse(params[:date]) : Date.today
	end
	
end
