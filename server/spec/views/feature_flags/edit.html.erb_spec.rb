require 'rails_helper'

RSpec.describe "feature_flags/edit", type: :view do
  let(:feature_flag) {
    FeatureFlag.create!(
      name: "MyString",
      value: false
    )
  }

  before(:each) do
    assign(:feature_flag, feature_flag)
  end

  it "renders the edit feature_flag form" do
    render

    assert_select "form[action=?][method=?]", feature_flag_path(feature_flag), "post" do

      assert_select "input[name=?]", "feature_flag[name]"

      assert_select "input[name=?]", "feature_flag[value]"
    end
  end
end
