class AmusementPark < ApplicationRecord
  has_many :rides
  validates_presence_of :name
  validates_presence_of :admission_cost

  def ride_mechanics
    rides.map { |x| x.mechanics }.flatten.uniq
  end

  def sorted_rides
    rides.sort_by { |x| x.mechanic_avg_xp }.reverse
  end
end