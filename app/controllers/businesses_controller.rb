class BusinessesController < ApplicationController
  def create
    if params[:business][:url]
      YelpJob.perform_later(params[:business][:url])
    end
    redirect_to root_path
  end
end
