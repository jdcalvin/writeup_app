require 'spec_helper'

describe "contents/edit" do
  before(:each) do
    @content = assign(:content, stub_model(Content,
      :code => "MyString",
      :cat => "MyString",
      :desc => "MyString",
      :context => "MyString"
    ))
  end

  it "renders the edit content form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", content_path(@content), "post" do
      assert_select "input#content_code[name=?]", "content[code]"
      assert_select "input#content_cat[name=?]", "content[cat]"
      assert_select "input#content_desc[name=?]", "content[desc]"
      assert_select "input#content_context[name=?]", "content[context]"
    end
  end
end
