class HomeController < ApplicationController
  def index
    @businesses = Business.order('rating DESC').to_a
  end
end
