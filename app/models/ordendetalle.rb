class Ordendetalle < ActiveRecord::Base
  belongs_to :orden
  has_many :serviciorepuestos
  validates :orden_id, :servicio_id, :presence => true
  validates_uniqueness_of :servicio_id, :scope => :orden_id, :message => "Servicio ya fue incluido en la orden."
end
