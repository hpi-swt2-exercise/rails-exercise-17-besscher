class Paper < ActiveRecord::Base
  scope :created_in, ->(year) { where('year == ?', year) }
  validates :title, :venue, :year, presence: true
  validates :year, numericality: { only_integer: true }
  has_and_belongs_to_many :authors
end
