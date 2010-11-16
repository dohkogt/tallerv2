class Serviciorepuesto < ActiveRecord::Base
  belongs_to :ordendetalle, :foreign_key => :orden_detalle_id
  validates :orden_detalle_id, :repuesto_id, :cantidad, :costo, :presence => true
end
