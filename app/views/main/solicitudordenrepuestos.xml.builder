xml.instruct!
unless @error_code.nil?
  xml.consultar_servicio do
    xml.ordenprueba false
  end
else
  xml.repuestos do
    @repder.each do |rep|
    xml.orden_id rep.id
    end
end
  
    end
