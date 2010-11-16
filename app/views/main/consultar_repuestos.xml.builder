xml.instruct!
unless @error_code.nil?
  xml.confirmacion_servicio do
    xml.confirmacion 0
  end
else
  xml.consultar_repuestos do
    @nombre.each do
    xml.repuesto_id @nombre
    end
    end
end
