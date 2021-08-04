class Contestant < ApplicationRecord
  belongs_to :bachelorette

  has_many :outing_contestants
  has_many :outings, through: :outing_contestants

  def self.average_age
    average(:age)
  end

  def self.unique_hometowns
    select('DISTINCT hometown')
    .order('contestants.hometown')
  end
end
