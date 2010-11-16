class Cita < ActiveRecord::Base
  belongs_to :vehiculo, :foreign_key => :cliente_id
  has_one :orden

  validates :fecha, :hora, :cliente_id, :estados_id, :presence => true

  validates_uniqueness_of :fecha, :scope => :hora, :message => "Ya existe una cita con ese horario."
  
end
