require 'dijkstra'

class DijkstraController < ApplicationController
  before_filter :set_svg_size, :only => :run
  before_filter :set_ways, :only => :run

  def run
    dijkstra = Dijkstra.new(params[:start], params[:finish])
    dijkstra.run if request.post? && params_valid?

    @ways_on_path = dijkstra.ways
    @nodes_on_path = dijkstra.nodes

    @total_distance = @ways_on_path.sum(0) { |way| way.distance }

    @start = params[:start]
    @finish = params[:finish]
  end

  private

  def params_valid?
    @params_valid ||= params[:start] && params[:finish] && params[:start] != params[:finish]
  end

  def set_ways
    @ways = Way.all(:include => :nodes).delete_if { |way| way.name.empty? }.sort_by(&:name)
  end

  def set_svg_size
    @svg_width = AppConfig.osm.image.dimensions.width
    @svg_height = AppConfig.osm.image.dimensions.height
  endht
  end
end
