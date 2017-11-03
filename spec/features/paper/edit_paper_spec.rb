require 'rails_helper'

describe 'Edit paper page', type: :feature do
  it 'should render without error' do
    @test_paper = FactoryGirl.create :paper
    visit edit_paper_path(@test_paper)
  end
  it 'should edit with no error' do
    @test_paper = FactoryGirl.create :paper
    visit edit_paper_path(@test_paper)

    fill_in 'paper_year', with: 12_345
    find('input[type="submit"]').click
  end
end
