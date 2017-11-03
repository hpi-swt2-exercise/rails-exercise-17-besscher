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

  it 'should display a link to create new papers' do
    visit papers_path

    expect(page).to have_link('Add paper')
  end

  it 'should display a link to show paper\'s details' do
    FactoryGirl.create :paper
    visit papers_path

    expect(page).to have_link('Show')
  end

  it 'should display a link to show paper\'s editing page' do
    FactoryGirl.create :paper
    visit papers_path

    expect(page).to have_link('Edit')
  end

  it 'should be able to destroy papers' do
    FactoryGirl.create :paper
    visit papers_path

    expect(page).to have_link('Destroy')
    expect(Paper.find_by_title('COMPUTING MACHINERY AND INTELLIGENCE')).not_to be_nil
    click_link('Destroy')
    expect(Paper.find_by_title('COMPUTING MACHINERY AND INTELLIGENCE')).to be_nil
  end
end
