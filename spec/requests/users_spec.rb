# frozen_string_literal: true

require 'rails_helper'
require 'shared_contexts'
RSpec.describe rank, type: :request do
  it 'users toppers and lowers' do
    user = FactoryBot.create(:user)
    user.save

    sign_in user

    get '/api/v1/users/topper-and-lower-users'

    response.body.include?('no content')
  end

  it 'users top 10 should need an integer params' do
    user = FactoryBot.create(:user)
    user.save

    sign_in user

    get '/api/v1/users/top-users/1'

    response.body.include?('no content')
  end
end
