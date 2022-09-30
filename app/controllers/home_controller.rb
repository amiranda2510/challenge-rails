class HomeController < ApplicationController
  def index
    ViewCount.increment('/')
  end
end
