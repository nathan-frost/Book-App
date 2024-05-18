class BooksController < ApplicationController
  def index
    matching_books = Book.all

    @list_of_books = matching_books.order({ :created_at => :desc })

    render({ :template => "books/index" })
  end

  def search
    @search_book = params.fetch("query_title")
        
    the_book = GoogleBooks.search(@search_book)
    first_book = the_book.first

    @title = first_book.title
    @description = first_book.description
    @published_date = first_book.published_date
    @isbn = first_book.isbn
    @page_count = first_book.page_count
    @publisher = first_book.publisher
    @authors = first_book.authors_array
    @image = first_book.image_link(:zoom => 2)

    render({ :template => "books/search" })
  end
  
  def show
    the_id = params.fetch("path_id")

    matching_books = Book.where({ :id => the_id })

    @the_book = matching_books.at(0)

    render({ :template => "books/show" })
  end

  def create
    the_book = Book.new
    the_book.title = params.fetch("query_title")
    the_book.description = params.fetch("query_description")
    the_book.published_date = params.fetch("query_published_date")
    the_book.isbn13 = params.fetch("query_isbn13")
    the_book.page_count = params.fetch("query_page_count")
    the_book.image_url = params.fetch("query_image_url")
    the_book.publisher = params.fetch("query_publisher")
    the_book.author_id = params.fetch("query_author_id")
    the_book.reviews_count = params.fetch("query_reviews_count")
    the_book.classifications_count = params.fetch("query_classifications_count")

    if the_book.valid?
      the_book.save
      redirect_to("/books", { :notice => "Book created successfully." })
    else
      redirect_to("/books", { :alert => the_book.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_book = Book.where({ :id => the_id }).at(0)

    the_book.title = params.fetch("query_title")
    the_book.description = params.fetch("query_description")
    the_book.published_date = params.fetch("query_published_date")
    the_book.isbn13 = params.fetch("query_isbn13")
    the_book.page_count = params.fetch("query_page_count")
    the_book.image_url = params.fetch("query_image_url")
    the_book.publisher = params.fetch("query_publisher")
    the_book.author_id = params.fetch("query_author_id")
    the_book.reviews_count = params.fetch("query_reviews_count")
    the_book.classifications_count = params.fetch("query_classifications_count")

    if the_book.valid?
      the_book.save
      redirect_to("/books/#{the_book.id}", { :notice => "Book updated successfully."} )
    else
      redirect_to("/books/#{the_book.id}", { :alert => the_book.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_book = Book.where({ :id => the_id }).at(0)

    the_book.destroy

    redirect_to("/books", { :notice => "Book deleted successfully."} )
  end
end
