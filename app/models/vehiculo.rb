class Vehiculo < ActiveRecord::Base
  has_many :citas, :foreign_key => :cliente_id
  has_many :ordenes, :through => :citas
  validates :placa, :presence => true, :uniqueness => true
end
