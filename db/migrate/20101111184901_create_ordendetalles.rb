class CreateOrdendetalles < ActiveRecord::Migration
  def self.up
    create_table :ordendetalles do |t|
      t.integer :orden_id
      t.integer :servicio_id
      t.text :descripcion

      t.timestamps
    end
  end

  def self.down
    drop_table :ordendetalles
  end
end
