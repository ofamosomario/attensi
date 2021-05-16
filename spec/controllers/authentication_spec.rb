# frozen_string_literal: true

require 'rails_helper'
require 'shared_contexts'
RSpec.describe Api::V1::AuthenticationController, type: :controller do
  let!(:user) { FactoryBot.create(:user) }
  describe 'POST #create' do
    context 'when user create a new authentication' do
      it 'return successfull - 200' do
        post :create, params: { email: user.email, password: user.password }
        expect(response.status).to eq(200)
      end
    end
  end
end
