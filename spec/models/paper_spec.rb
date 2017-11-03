require 'rails_helper'

describe 'paper Object', type: :model do

  it 'should create example object' do
    paper = Paper.new(title: 'COMPUTING MACHINERY AND INTELLIGENCE', venue: 'Mind 49: 433-460', year: 1950)
    expect(paper.title).to eq('COMPUTING MACHINERY AND INTELLIGENCE')
    expect(paper.venue).to eq('Mind 49: 433-460')
    expect(paper.year).to eq(1950)
  end

  it 'should not be valid without a title' do
    paper = Paper.new(id: 42, venue: 'Mind 49: 433-460', year: 1950)
    expect(paper).not_to be_valid
  end

  it 'should not be valid without a venue' do
    paper = Paper.new(id: 42, title: 'COMPUTING MACHINERY AND INTELLIGENCE', year: 1950)
    expect(paper).not_to be_valid
  end

  it 'should not be valid without a year' do
    paper = Paper.new(id: 42, title: 'COMPUTING MACHINERY AND INTELLIGENCE', venue: 'Mind 49: 433-460')
    expect(paper).not_to be_valid
  end

  it 'should not be valid with non-int year' do
    paper = Paper.new(id: 42, title: 'COMPUTING MACHINERY AND INTELLIGENCE', venue: 'Mind 49: 433-460', year:'nineteen-fifty')
    expect(paper).not_to be_valid
  end

  it 'should have an author list' do
    paper = Paper.new(id: 42, title: 'COMPUTING MACHINERY AND INTELLIGENCE', venue: 'Mind 49: 433-460', year:'nineteen-fifty')
    expect(paper.authors).to eq([])
  end

end
