require 'spec_helper'

describe "plays/new" do
  before(:each) do
    assign(:play, stub_model(Play,
      :table_id => 1,
      :note => "MyText"
    ).as_new_record)
  end

  it "renders new play form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => plays_path, :method => "post" do
      assert_select "input#play_table_id", :name => "play[table_id]"
      assert_select "textarea#play_note", :name => "play[note]"
    end
  end
end
