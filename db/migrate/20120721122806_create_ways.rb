class CreateWays < ActiveRecord::Migration
  def change
    create_table :ways do |t|
      t.string :osm_id
      t.string :name
      t.boolean :oneway

      t.timestamps
    end
  end
end
