require 'rails_helper'

RSpec.describe "feature_flags/index", type: :view do
  before(:each) do
    assign(:feature_flags, [
      FeatureFlag.create!(
        name: "Name",
        value: false
      ),
      FeatureFlag.create!(
        name: "Name",
        value: false
      )
    ])
  end

  it "renders a list of feature_flags" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
  end
end
