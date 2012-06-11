require 'spec_helper'

describe "plays/show" do
  before(:each) do
    @play = assign(:play, stub_model(Play,
      :table_id => 1,
      :note => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/MyText/)
  end
end
