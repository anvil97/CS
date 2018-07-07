class SearchsController < ApplicationController
  def index
    if params[:date].nil?
      @searchs = []
    else
      @searchs = Customer.where('created_at between ? and ?',params[:date][:from_date].to_time,params[:date][:to_date].to_time.end_of_day)
    end
  end
end
