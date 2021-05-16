# frozen_string_literal: true

require 'rails_helper'
RSpec.describe RegistrationsController, type: :controller do
  let!(:user) { FactoryBot.create(:user) }
  before :each do
    request.env['devise.mapping'] = Devise.mappings[:user]
  end

  describe 'POST #create' do
    context 'when create a new user' do
      it 'return successfull - 200' do
        post :create, params: {
          email: 'test@gmail.com',
          first_name: 'teste',
          last_name: 'teste',
          password: '123123',
          password_confirmation: '123123'
        }
        expect(response.status).to eq(200)
      end
    end
    context 'when doesnt have password and email' do
      it 'return successfull - 200' do
        post :create
        expect(response.status).to eq(422)
      end
    end
  end
end
