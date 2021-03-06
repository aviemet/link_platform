# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::PhonesController, type: :controller do
  let(:link_instance) { create(:link_instance) }
  let(:phone) { create(:phone, link_instance: link_instance) }
  let(:admin) { create(:admin, link_instance: link_instance) }

  before do
    allow_any_instance_of(ApplicationController).
      to receive(:current_link_instance).and_return(link_instance)
  end

  # This should return the minimal set of attributes required to create a valid
  # Phone. As you add validations to Phone, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    {
      location_id: '1',
      service_id: '1',
      organization_id: '1',
      contact_id: '1',
      service_at_location_id: '1',
      number: '+1 415 123-4567',
      extension: 5,
      phone_type: 'voice',
      language: 'eng',
      description: 'A phone to test with'
    }
  end

  let(:invalid_attributes) do
    {
      phone_type: 'dunno',
      description: 'No idea'
    }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PhonesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: phone.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'when not logged in' do
      it 'returns unauthorized' do
        post :create, params: { phone: valid_attributes },
                      session: valid_session
        expect(response).to have_http_status(401)
      end
    end

    context 'when logged in to another instance' do
      it 'returns not found' do
        login create(:admin)

        post :create, params: { phone: valid_attributes },
                      session: valid_session
        expect(response).to have_http_status(404)
      end
    end

    context 'when logged in' do
      before do
        login admin
      end

      context 'with valid params' do
        it 'creates a new Phone' do
          expect do
            post :create, params: { phone: valid_attributes },
                          session: valid_session
          end.to change(Phone, :count).by(1)
        end

        it 'renders a JSON response with the new phone' do
          post :create, params: { phone: valid_attributes },
                        session: valid_session
          expect(response).to have_http_status(:created)
          expect(response.content_type).to eq('application/json')
          expect(response.location).to eq(api_phone_url(Phone.last))
        end
      end

      context 'with invalid params' do
        it 'renders a JSON response with errors for the new phone' do
          post :create, params: { phone: invalid_attributes },
                        session: valid_session
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.content_type).to eq('application/json')
        end
      end
    end
  end

  describe 'PUT #update' do
    let(:new_attributes) do
      {
        extension: 55
      }
    end

    context 'when not logged in' do
      it 'returns unauthorized' do
        put :update, params: { id: phone.to_param, phone: new_attributes },
                     session: valid_session
        expect(response).to have_http_status(401)
      end
    end

    context 'when logged in' do
      before do
        login admin
      end

      context 'with valid params' do
        it 'updates the requested phone' do
          put :update, params: { id: phone.to_param, phone: new_attributes },
                       session: valid_session
          phone.reload
          expect(phone.extension).to eq(55)
        end

        it 'renders a JSON response with the phone' do
          put :update, params: { id: phone.to_param, phone: valid_attributes },
                       session: valid_session
          expect(response).to have_http_status(:ok)
          expect(response.content_type).to eq('application/json')
        end
      end

      context 'with invalid params' do
        it 'renders a JSON response with errors for the phone' do
          params = { id: phone.to_param, phone: invalid_attributes }
          put :update, params: params, session: valid_session
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.content_type).to eq('application/json')
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when not logged in' do
      it 'returns unauthorized' do
        delete :destroy, params: { id: phone.to_param }, session: valid_session
        expect(response).to have_http_status(401)
      end
    end

    context 'when logged in' do
      before do
        login admin
      end

      it 'destroys the requested phone' do
        phone.save!
        expect do
          delete :destroy, params: { id: phone.to_param },
                           session: valid_session
        end.to change(Phone, :count).by(-1)
      end
    end
  end
end
