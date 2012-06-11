require 'spec_helper'

describe "plays/edit" do
  before(:each) do
    @play = assign(:play, stub_model(Play,
      :table_id => 1,
      :note => "MyText"
    ))
  end

  it "renders the edit play form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => plays_path(@play), :method => "post" do
      assert_select "input#play_table_id", :name => "play[table_id]"
      assert_select "textarea#play_note", :name => "play[note]"
    end
  end
end
