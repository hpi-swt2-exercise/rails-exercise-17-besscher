require 'rails_helper'

describe 'Index author page', type: :feature do
  it 'should render without error' do
    visit authors_path
  end

  it 'should display alan' do
    FactoryGirl.create :author
    visit authors_path

    expect(page.text).to match(/alan turing/i)
    expect(page.text).to match(/http:\/\/wikipedia\.de\/Alan_Turing/i)
  end

  it 'should display a link to create new authors' do
    visit authors_path

    expect(page).to have_link('Add author')
  end

  it 'should display a link to show alan\'s details' do
    FactoryGirl.create :author
    visit authors_path

    expect(page).to have_link('Show')
  end

  it 'should display a link to show alan\'s editing page' do
    FactoryGirl.create :author
    visit authors_path

    expect(page).to have_link('Edit')
  end

  it 'should be able to destroy authors' do
    FactoryGirl.create :author
    visit authors_path

    expect(page).to have_link('Destroy')
    click_link('Destroy')
    expect(Author.find_by_first_name('Alan')).to be_nil
  end
end
