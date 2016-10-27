class Screening < ActiveRecord::Base
  geocoded_by :address

  reverse_geocoded_by :latitude, :longitude do |obj,results|
    if geo = results.first
      obj.state    = geo.state
    end
  end

  before_validation :geocode
  after_validation :reverse_geocode
  validates :latitude, presence: true
  validates :longitude, presence: true
end
