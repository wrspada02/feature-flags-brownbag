require 'rails_helper'

RSpec.describe "Api::V1::FeatureFlags", type: :request do
  describe "GET /index" do
    it "returns a list of feature flags" do
      FeatureFlag.create(name: "Feature 1", value: true)
      FeatureFlag.create(name: "Feature 2", value: false)
      get "/api/v1/feature_flags"
      expect(response).to have_http_status(:ok)
      expect(json.size).to eq(2)
    end
  end

  describe "GET /show" do
    it "returns a specific feature flag" do
      feature_flag = FeatureFlag.create(name: "Test Feature", value: true)
      get "/api/v1/feature_flags/#{feature_flag.id}"
      expect(response).to have_http_status(:ok)
      expect(json["name"]).to eq("Test Feature")
    end
  end

  describe "POST /create" do
    it "creates a new feature flag" do
      post "/api/v1/feature_flags", params: { feature_flag: { name: "New Feature", value: true } }
      expect(response).to have_http_status(:created)
      expect(json["name"]).to eq("New Feature")
    end
  end

  describe "PUT /update" do
    it "updates an existing feature flag" do
      feature_flag = FeatureFlag.create(name: "Old Feature", value: false)
      put "/api/v1/feature_flags/#{feature_flag.id}", params: { feature_flag: { name: "Updated Feature", value: true } }
      expect(response).to have_http_status(:ok)
      expect(json["name"]).to eq("Updated Feature")
    end
  end

  describe "DELETE /destroy" do
    it "deletes a feature flag" do
      feature_flag = FeatureFlag.create(name: "Feature to be deleted", value: true)
      delete "/api/v1/feature_flags/#{feature_flag.id}"
      expect(response).to have_http_status(:no_content)
    end
  end
end
