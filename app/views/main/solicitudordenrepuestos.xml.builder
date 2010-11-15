xml.instruct!
unless @error_code.nil?
  xml.consultar_servicio do
    xml.ordenprueba 0
  end
else
  xml.repuestos do
    @repuesto.each do
    xml.repuesto_id @repuesto.repuesto_id
end
end       
    end
