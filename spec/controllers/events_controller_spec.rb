require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  let!(:event_params) { { event_type: 'Event A' } }
  let!(:user) { User.find_by(email: "test1@email.com") || FactoryBot.create(:user, email: "test1@email.com") }

  describe 'GET #index' do
    it 'renders the index template' do
      sign_in user
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    it 'renders the new template' do
      sign_in user
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new event' do
        sign_in user
        expect {
          post :create, params: event_params
        }.to change(Event, :count).by(1)
      end

      it 'redirects to the created event' do
        sign_in user
        post :create, params: event_params
        expect(response).to redirect_to(event_url(Event.last))
      end
    end

    context 'with invalid params' do
      it 'does not create a new event' do
        sign_in user
        expect {
          post :create, params: { event_type: nil }
        }.not_to change(Event, :count)
      end
    end
  end

end
