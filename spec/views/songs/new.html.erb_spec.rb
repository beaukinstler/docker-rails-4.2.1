require 'rails_helper'

RSpec.describe "songs/new", type: :view do
  before(:each) do
    assign(:song, Song.new(
      :title => "MyString",
      :length => "MyString",
      :published_by => "MyString"
    ))
  end

  it "renders new song form" do
    render

    assert_select "form[action=?][method=?]", songs_path, "post" do

      assert_select "input#song_title[name=?]", "song[title]"

      assert_select "input#song_length[name=?]", "song[length]"

      assert_select "input#song_published_by[name=?]", "song[published_by]"
    end
  end
end
