class CreateCitas < ActiveRecord::Migration
  def self.up
    create_table :citas do |t|
      t.date :fecha
      t.integer :hora
      t.integer :cliente_id
      t.integer :estados_id

      t.timestamps
    end
  end

  def self.down
    drop_table :citas
  end
end
