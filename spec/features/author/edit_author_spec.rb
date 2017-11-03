require 'rails_helper'

describe "Edit author page", type: :feature do

  it "should render withour error" do
    @alan = FactoryGirl.create :author
    visit edit_author_path(@alan)
  end

end