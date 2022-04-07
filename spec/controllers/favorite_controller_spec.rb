require 'rails_helper'

RSpec.describe FavoritesController do
  describe 'POST #create' do
    context 'When create favorite' do
      include_context 'with authenticated user'
      let(:bookParams) { create(:book) }
      
      # /users/:user_id/favorites
      subject(:http_response) do
        post :create,
             params: { user_id: current_user.id,
                       favorite: { user_id: current_user.id,
                               book_id: bookParams[:id]} }
      end

      it 'creates the favorite successfully' do
        expect(JSON.parse(http_response.body).to_json).to eq FavoriteSerializer.new(Favorite.last).to_json
      end

      it { is_expected.to have_http_status(201) }
    end

    context 'When create favorite without book' do
      include_context 'with authenticated user'
      let(:bookParams) { create(:book) }
      
      # /users/:user_id/favorites
      subject(:http_response) do
        post :create,
             params: { user_id: current_user.id,
                       favorite: { user_id: current_user.id,
                               book_id: nil} }
      end

      it { is_expected.to have_http_status(400) }
    end
  end 
  
end
