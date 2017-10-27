class TestController < ApplicationController
  def index
	  @tests = Test.all
	  @tests_by_date = @tests.group_by(&:published_on)
	  @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  def show
  end

  def new
  end
end
