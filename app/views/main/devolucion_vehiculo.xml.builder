xml.instruct!
unless @error_code.nil?
  xml.consultar_servicio do
    xml.ordenprueba 0
  end
else
  xml.devolucion_vehiculo do
    xml.id_orden @orden.id  
      xml.servicios do
      @odetalles.each do |orden|
      xml.servicio_id orden.servicio_id
      xml.repuestos do
      @repdesc.each do |rep|
      xml.repuesto_nombre rep.repuesto_id
      xml.cantidad rep.cantidad
      xml.costo    rep.costo
      end
      end   
end
end
    end             
    end
