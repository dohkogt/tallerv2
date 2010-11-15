xml.instruct!
unless @error_code.nil?
  xml.confirmacion_servicio do
    xml.confirmacion 0
  end
else
  xml.consultar_repuestos do
   @repuesto.each do  
    xml.repuesto_id @repuesto.id
    end

  end
end
