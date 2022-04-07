class FavoritesController < ApplicationController
    def create
      favorite = Favorite.new(favorite_params)
      authorize favorite
  
      if favorite.save
        render json: favorite, serializer: FavoriteSerializer, status: :created
      else
        render json: favorite.errors, status: :bad_request
      end
    end
  
    private
  
    def favorite_params
      params.require(:favorite).permit(:user_id, :book_id)
    end
end
  