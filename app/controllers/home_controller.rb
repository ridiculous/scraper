class HomeController < ApplicationController
  def index
    @businesses = Business.all
  end
end
