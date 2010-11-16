class CreateServiciorepuestos < ActiveRecord::Migration
  def self.up
    create_table :serviciorepuestos do |t|
      t.integer :orden_detalle_id
      t.integer :repuesto_id
      t.integer :cantidad
      t.decimal :costo

      t.timestamps
    end
  end

  def self.down
    drop_table :serviciorepuestos
  end
end
