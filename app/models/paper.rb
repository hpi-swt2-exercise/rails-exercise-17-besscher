class Paper < ActiveRecord::Base
  validates :title, :venue, :year, presence: true
  validates :year, numericality: { only_integer: true }
  has_and_belongs_to_many :authors

  def author_1
    authors[0].id if authors[0]
  end

  def author_2
    authors[1].id if authors[1]
  end

  def author_3
    authors[2].id if authors[2]
  end

  def author_4
    authors[3].id if authors[3]
  end

  def author_5
    authors[4].id if authors[4]
  end
end
