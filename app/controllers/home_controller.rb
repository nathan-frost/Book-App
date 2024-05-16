class HomeController < ApplicationController
  def show


    render({ :template => "home/show" })
  end
end
