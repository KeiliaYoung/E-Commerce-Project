require 'rails_helper'

  describe UsersController, type: :controller do
    before do
      @user = FactoryBot.create(:user)
      @user2 = FactoryBot.create(:user)
    end

    # Same as above==> let(:user) { User.create!(email: 'user@example.com', password: 'password') }
    # Or @user = User.create!(email: "peter@example.com", password: "1234567890")

  describe 'GET #show' do
      context 'when a user is logged in' do

        before do
          sign_in @user
        end

        it 'loads correct user details' do
          get :show, params: { id: @user.id }
          expect(response).to be_ok
          expect(assigns(:user)).to eq @user
        end

        it "cannot access the other user's page" do
          get :show, params: { id: @user2.id }
          expect(response).to have_http_status(302)
          expect(response).to redirect_to root_path
        end
      end

        context 'when a user is not logged in' do
          it 'redirects to login' do
            get :show, params: { id: @user.id }
            expect(response).to redirect_to new_user_session_path
          end
        end
    end
  end
