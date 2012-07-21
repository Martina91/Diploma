class Node < ActiveRecord::Base
  has_and_belongs_to_many :ways

  validates :osm_id, :presence => true, :uniqueness => true
  validates :latitude, :presence => true, :numericality => true
  validates :longitude, :presence => true, :numericality => true

end
