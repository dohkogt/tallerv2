xml.instruct!
unless @error_code.nil?
  xml.confirmacion_servicio do
    xml.confirmacion 0
  end
else
  xml.consultar_repuesto do
    @repuestos.each do |repuesto|
     xml.repuesto_id repuesto[:codigo]
     xml.repuesto_nombre repuesto[:descrip]
    end
    end
end
