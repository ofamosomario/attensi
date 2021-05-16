# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RegistrationsController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/api/v1/auth').to route_to({ format: :json, controller: 'api/v1/authentication', action: 'create' })
    end

    it 'routes to #fetch' do
      expect(get: '/api/v1/auth').to route_to({ format: :json, controller: 'api/v1/authentication', action: 'fetch' })
    end
  end
end
