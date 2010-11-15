class Cita < ActiveRecord::Base
  belongs_to :vehiculo
  belongs_to :orden
  has_many :citas  
  validates :fecha, :hora, :cliente_id, :estados_id, :presence => true

  validates_uniqueness_of :fecha, :scope => :hora, :message => "Ya existe una cita con ese horario."
  
end
