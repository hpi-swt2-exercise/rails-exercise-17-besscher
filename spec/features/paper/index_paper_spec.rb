require 'rails_helper'

describe 'Index paper page', type: :feature do
  it 'should render without error' do
    visit papers_path
  end

  it 'should display test paper' do
    FactoryGirl.create :paper
    visit papers_path

    expect(page.text).to match(/COMPUTING MACHINERY AND INTELLIGENCE/i)
  end
end
