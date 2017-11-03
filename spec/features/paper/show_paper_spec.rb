require 'rails_helper'

describe 'Show paper page', type: :feature do
  it 'should render without error' do
    @test_paper = FactoryGirl.create :paper
    visit paper_path(@test_paper)
  end

  it 'should display all the authors' do
    @test_paper = FactoryGirl.create :paper
    visit paper_path(@test_paper)

    expect(page.text).to match(/alan turing/i)
  end
end
