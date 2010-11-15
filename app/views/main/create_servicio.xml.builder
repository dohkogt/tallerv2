xml.instruct!
unless @error_code.nil?
  xml.confirmacion_servicio do
    xml.confirmacion 0
  end
else
  xml.confirmacion_servicio do
    xml.confirmacion 1
  end
end
