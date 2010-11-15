class CreateOrdenes < ActiveRecord::Migration
  def self.up
    create_table :ordenes do |t|
      t.integer :cita_id
      t.integer :estado_id

      t.timestamps
    end
  end

  def self.down
    drop_table :ordenes
  end
end
