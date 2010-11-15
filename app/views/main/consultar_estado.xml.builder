xml.instruct!
unless @error_code.nil?
  xml.consultar_servicio do
    xml.ordenprueba 0
  end
else
  xml.consultar_estado do
    xml.id_orden @orden.id
    xml.estatus @orden.estado.nombre
  end
end
