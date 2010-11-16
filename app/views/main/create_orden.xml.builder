xml.instruct!
unless @error_code.nil?
  xml.error do    
    xml.code @error_code
    xml.descripcion @error_description
 end
else
  xml.respuesta_recepcion_vehiculo do
    xml.id_orden @orden.id
  end
end
