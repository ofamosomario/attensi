require "rails_helper"

RSpec.describe Api::V1::UsersController, type: :routing do
  
  describe "routing" do

    it "routes to #top_users" do
      expect(get: "/api/v1/users/top-users/19").to route_to({format: :json, controller: "api/v1/users", action: "top_users", week_number: "19"})
    end

    it "routes to #topper_and_lower_users" do
      expect(get: "/api/v1/users/topper-and-lower-users").to route_to({format: :json, controller: "api/v1/users", action: "topper_and_lower_users"})
    end

  end

end