class Serviciorepuesto < ActiveRecord::Base
  belongs_to :ordendetalle
     validates :orden_detalle_id, :repuesto_id, :cantidad, :costo, :presence => true
end
