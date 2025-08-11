require 'rails_helper'

RSpec.describe "feature_flags/show", type: :view do
  before(:each) do
    assign(:feature_flag, FeatureFlag.create!(
      name: "Name",
      value: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/false/)
  end
end
