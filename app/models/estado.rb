class Estado < ActiveRecord::Base
  has_many :cita
  has_many :orden
  validates :nombre, :presence => true
  
end
