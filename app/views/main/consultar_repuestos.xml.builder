xml.instruct!
unless @error_code.nil?
  xml.confirmacion_servicio do
    xml.confirmacion 0
  end
else
  xml.consultar_repuestos do
   @repuestos.each do |repuesto|
    xml.repuesto_id repuesto[:codigo]
    xml.nombre	    repuesto[:descrip]
    end
    end  
end
