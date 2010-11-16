xml.instruct!
unless @error_code.nil?
  xml.error do    
    xml.code @error_code
    xml.descripcion @error_description
  end
else
  xml.consultar_hora do
    if @horaslibres.nil?
      xml.fecha do
        xml.hora do
          xml.disponible @disponible
        end
      end
    else
      xml.fecha do
        @horaslibres.each do |hora|
          xml.hora hora
        end
      end
    end
  end
end
