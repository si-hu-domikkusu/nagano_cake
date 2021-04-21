class SearchController < ApplicationController

  def search
    @genre = Genre.find(params[:genre_id])
    @items = @genre.items.page(params[:page]).per(8)
    @genres = Genre.all
    render 'items/index'
  end

end