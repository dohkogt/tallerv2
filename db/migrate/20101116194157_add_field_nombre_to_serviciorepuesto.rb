class AddFieldNombreToServiciorepuesto < ActiveRecord::Migration
  def self.up
    add_column :serviciorepuestos, :nombre, :string
  end

  def self.down
    remove_column :serviciorepuestos, :nombre
  end
end
