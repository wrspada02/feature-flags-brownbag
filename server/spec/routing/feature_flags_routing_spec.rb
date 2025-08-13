require "rails_helper"

RSpec.describe FeatureFlagsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/feature_flags").to route_to("feature_flags#index")
    end

    it "routes to #new" do
      expect(get: "/feature_flags/new").to route_to("feature_flags#new")
    end

    it "routes to #show" do
      expect(get: "/feature_flags/1").to route_to("feature_flags#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/feature_flags/1/edit").to route_to("feature_flags#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/feature_flags").to route_to("feature_flags#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/feature_flags/1").to route_to("feature_flags#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/feature_flags/1").to route_to("feature_flags#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/feature_flags/1").to route_to("feature_flags#destroy", id: "1")
    end
  end
end
