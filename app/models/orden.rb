class Orden < ActiveRecord::Base
  ESTADO_RECIBIDO = 1
  
  belongs_to :cita
  belongs_to :estado
  has_many :ordendetalles
  validates :cita_id, :estado_id, :presence => true
  validates_uniqueness_of :cita_id, :message => "Cita ya ha sido utilizada."
end
