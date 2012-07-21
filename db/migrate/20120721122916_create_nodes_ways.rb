class CreateNodesWays < ActiveRecord::Migration
  def change
    create_table :nodes_ways do |t|
      t.integer :node_id
      t.integer :way_id

      t.timestamps
    end
  end
end
