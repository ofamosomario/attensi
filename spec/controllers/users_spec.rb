# frozen_string_literal: true

require 'rails_helper'
require 'shared_contexts'
RSpec.describe Api::V1::UsersController, type: :controller do
  let!(:user) { FactoryBot.create(:user) }
  describe 'GET #best_worst_rated_user' do
    context 'when doesnt have users' do
      it 'return not found - 404' do
        sign_in(user)
        get :best_worst_rated_user
        expect(response.status).to eq(404)
      end
    end
    context 'when have users' do
      it 'return 200' do
        user_one = User.create(
          first_name: 'Mario',
          last_name: 'Leite',
          email: 'mario@gmail.com',
          password: '123123'
        )
        user_two = User.create(
          first_name: 'Filippo',
          last_name: 'Brettas',
          email: 'filippo@gmail.com',
          password: '123123'
        )
        Score.create(user_id: user_one.id, started_playing: '2021-04-15 18:56:22.423987', time_spent: '00:20:00', score_value: 10)
        Score.create(user_id: user_one.id, started_playing: '2021-04-15 18:56:22.423987', time_spent: '00:20:00', score_value: 20)
        Score.create(user_id: user_two.id, started_playing: '2021-04-15 18:56:22.423987', time_spent: '00:20:00', score_value: 10)
        Score.create(user_id: user_two.id, started_playing: '2021-04-15 18:56:22.423987', time_spent: '00:20:00', score_value: 30)

        sign_in(user)
        get :best_worst_rated_user
        expect(response.status).to eq(200)
      end
    end
  end
  describe 'GET #top_users' do
    context 'when doesnt have users' do
      it 'return not found - 404' do
        sign_in(user)
        get :top_users, params: { week_number: 19 }
        expect(response.status).to eq(404)
      end
    end
  end
end
