require 'rails_helper'

RSpec.describe "feature_flags/new", type: :view do
  before(:each) do
    assign(:feature_flag, FeatureFlag.new(
      name: "MyString",
      value: false
    ))
  end

  it "renders new feature_flag form" do
    render

    assert_select "form[action=?][method=?]", feature_flags_path, "post" do

      assert_select "input[name=?]", "feature_flag[name]"

      assert_select "input[name=?]", "feature_flag[value]"
    end
  end
end
