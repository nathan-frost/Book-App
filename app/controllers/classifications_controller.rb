class ClassificationsController < ApplicationController
  def index
    matching_classifications = Classification.all

    @list_of_classifications = matching_classifications.order({ :created_at => :desc })

    render({ :template => "classifications/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_classifications = Classification.where({ :id => the_id })

    @the_classification = matching_classifications.at(0)

    render({ :template => "classifications/show" })
  end

  def create
    the_classification = Classification.new
    the_classification.book_id = params.fetch("query_book_id")
    the_classification.category_id = params.fetch("query_category_id")

    if the_classification.valid?
      the_classification.save
      redirect_to("/classifications", { :notice => "Classification created successfully." })
    else
      redirect_to("/classifications", { :alert => the_classification.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_classification = Classification.where({ :id => the_id }).at(0)

    the_classification.book_id = params.fetch("query_book_id")
    the_classification.category_id = params.fetch("query_category_id")

    if the_classification.valid?
      the_classification.save
      redirect_to("/classifications/#{the_classification.id}", { :notice => "Classification updated successfully."} )
    else
      redirect_to("/classifications/#{the_classification.id}", { :alert => the_classification.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_classification = Classification.where({ :id => the_id }).at(0)

    the_classification.destroy

    redirect_to("/classifications", { :notice => "Classification deleted successfully."} )
  end
end
