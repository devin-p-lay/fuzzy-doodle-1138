class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :ride_mechanics
  has_many :mechanics, through: :ride_mechanics
  
  validates_presence_of :name
  validates_presence_of :thrill_rating

  def mechanic_avg_xp
    ((mechanics.sum { |x| x.years_experience })/mechanics.count.to_f).round(2)
  end
end