require 'rails_helper'

RSpec.describe "songs/index", type: :view do
  before(:each) do
    assign(:songs, [
      Song.create!(
        :title => "Title",
        :length => "Length",
        :published_by => "Published By"
      ),
      Song.create!(
        :title => "Title",
        :length => "Length",
        :published_by => "Published By"
      )
    ])
  end

  it "renders a list of songs" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Length".to_s, :count => 2
    assert_select "tr>td", :text => "Published By".to_s, :count => 2
  end
end
