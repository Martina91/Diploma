class Way < ActiveRecord::Base
  has_and_belongs_to_many :nodes

  validates :osm_id, :presence => true, :uniqueness => true

  def key
    if name.present?
      "#{name} (#{osm_id})"
    else
      "No name (#{osm_id})"
    end
  end
end
