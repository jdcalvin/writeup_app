require 'spec_helper'

describe "contents/show" do
  before(:each) do
    @content = assign(:content, stub_model(Content,
      :code => "Code",
      :cat => "Cat",
      :desc => "Desc",
      :context => "Context"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Code/)
    rendered.should match(/Cat/)
    rendered.should match(/Desc/)
    rendered.should match(/Context/)
  end
end
