require 'spec_helper'

describe "contents/index" do
  before(:each) do
    assign(:contents, [
      stub_model(Content,
        :code => "Code",
        :cat => "Cat",
        :desc => "Desc",
        :context => "Context"
      ),
      stub_model(Content,
        :code => "Code",
        :cat => "Cat",
        :desc => "Desc",
        :context => "Context"
      )
    ])
  end

  it "renders a list of contents" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "Cat".to_s, :count => 2
    assert_select "tr>td", :text => "Desc".to_s, :count => 2
    assert_select "tr>td", :text => "Context".to_s, :count => 2
  end
end
