class HomeController < ApplicationController
  def show
    @list_of_authors = Author.order({ :created_at => :desc }).first(3)
    @list_of_books = Book.order({ :created_at => :desc }).first(3)
    @list_of_reviews = Review.order({ :created_at => :desc }).first(3)



    render({ :template => "home/show" })
  end
end
