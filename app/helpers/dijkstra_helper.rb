module DijkstraHelper

  def svg_map_for_nodes_script_tag(nodes)
    image_url = AppConfig.osm.image.path.relative + "?" + Time.now.to_i.to_s
    bounds = AppConfig.osm.bounds

    script = <<-JS
      $(function() {
        $('#map').svg({loadURL: '#{image_url}', onLoad: function(svg) {
          var width = svg._svg.viewBox.baseVal.width;
          var height = svg._svg.viewBox.baseVal.height;
          var options = { width: width,
                          height: height,
                          min: { lat: #{bounds.min.latitude}, lon: #{bounds.min.longitude} },
                          max: { lat: #{bounds.max.latitude}, lon: #{bounds.max.longitude} },
                          nodes: #{nodes.to_json},
                          svg: svg };

          var svg_map = new SvgMap(options);
          document.svg_map = svg_map;

          svg_map.init();
        }});
      });
    JS

    javascript_tag script
  end

  def svg_map_integration_with_select_boxes_script_tag
    script = <<-JS
      $(function() {
        function coordinates_from_select($select) {
          return document.svg_map.coordinates_from_geographical($select.find("option:selected").text());
        }

        $("#start").change(function() {
          var coordinates = coordinates_from_select($(this));
          document.svg_map.change(document.svg_map.beginPoint, { cx: coordinates[0], cy: coordinates[1] });
        });

        $("#finish").change(function() {
          var coordinates = coordinates_from_select($(this));
          document.svg_map.change(document.svg_map.endPoint, { cx: coordinates[0], cy: coordinates[1] });
        });
      });
    JS

    javascript_tag script
  end

  def nodes_grouped_by_way_for_select(ways, options = {})
    grouped_options = {}

    ways.each do |way|
      grouped_options[way.key] ||= []
      grouped_options[way.key] += way.nodes.collect do |node|
        ["#{node.latitude}N #{node.longitude}E", node.osm_id]
      end
    end

    grouped_options_for_select(grouped_options, options)
  end
end  

