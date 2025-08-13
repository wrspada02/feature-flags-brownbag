require 'rails_helper'

RSpec.describe FeatureFlag, type: :model do
  describe "validations" do
    it "validates presence of name and value" do
      feature_flag = FeatureFlag.new
      expect(feature_flag).not_to be_valid
      expect(feature_flag.errors[:name]).to include("can't be blank")
      expect(feature_flag.errors[:value]).to include("can't be blank")
    end

    it "validates inclusion of value in [true, false]" do
      feature_flag = FeatureFlag.new(name: "Test Feature", value: nil)
      expect(feature_flag).not_to be_valid
      expect(feature_flag.errors[:value]).to include("is not included in the list")
    end
  end
end
