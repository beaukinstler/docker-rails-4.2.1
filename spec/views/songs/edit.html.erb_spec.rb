require 'rails_helper'

RSpec.describe "songs/edit", type: :view do
  before(:each) do
    @song = assign(:song, Song.create!(
      :title => "MyString",
      :length => "MyString",
      :published_by => "MyString"
    ))
  end

  it "renders the edit song form" do
    render

    assert_select "form[action=?][method=?]", song_path(@song), "post" do

      assert_select "input#song_title[name=?]", "song[title]"

      assert_select "input#song_length[name=?]", "song[length]"

      assert_select "input#song_published_by[name=?]", "song[published_by]"
    end
  end
end
