class Dijkstra
  attr_reader :ways, :nodes

  def initialize(begin_id, end_id)
    @begin_id = begin_id
    @end_id = end_id
    @ways = []
    @nodes = []
  end

  def run
    @result = %x{ cd #{AppConfig.dijkstra.search.dir}; ./#{AppConfig.dijkstra.search.file} #{@begin_id} #{@end_id} #{AppConfig.osm.source.path} -o #{AppConfig.dijkstra.result.path} }
    Rails.logger.info @result

    parser = ShortestPath::XmlParser.new
    parser.parse_file(AppConfig.dijkstra.result.path)

    @ways = parser.ways
    @nodes = parser.nodes
  end
end