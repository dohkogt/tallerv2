require 'rubygems'
require 'nokogiri'
require 'open-uri'

class MainController < ApplicationController

  
# Get http://localhost:3000/descargo1/:orden_id/servi_id
  def descargo1
    i_orden = [:orden_id]
    i_serv  = [:servi_id]
    url_desc1 = "http://192.168.2.102:5050/bodega/solicitud_orden.php?idorden=#{i_repuesto}&idservicio=#{i_serv}"
        puts url_dec1
  end

# Get http://localhost:3000/solicitudordenrepuestos/:orden_id/:servi_id  
  
  def solicitudordenrepuestos
    i_orden = [:orden_id]
    i_serv = params[:servi_id]
    @ordendetalle = Ordendetalle.find_all_by_orden_id(i_orden)
    @detalle = @ordetalle
    @detalle.each do |odetalle|
      idodetalle = odetalle.id
      @repuesto = Serviciorepuesto.find_all_by_orden_detalle_id(idodetalle)
    end

    respond_to do |format|
      format.xml
    end
  end
  
# Get http://localhost:3000/devolucionvehiculo/:orden_id
  def devolucion_vehiculo
    i_orden = params[:orden_id]
    @orden = Orden.find_by_id(i_orden)
    id_orden = @orden.id.to_i
    # @odetalles = Ordendetalle.select('servicio_id').where("orden_id = ?", i_orden)
    @odetalles = Ordendetalle.find_all_by_orden_id(id_orden)
    @bsrepuestos = @odetalles
    @bsrepuestos.each do 
      iddetalle = @bsrepuestos.orden_detalle_id
      @repdesc = Serviciorepuesto.find_all_by_orden_detalle_id(iddetalle)
    end
      
    respond_to do |format|
         format.xml
    end
 end
  
# GET http://localhost:3000/consultarestado/:orden_id'
  def consultar_estado
    i_orden = params[:order_id]
    i_orden = i_orden.to_i
    @orden = Orden.find(i_orden)
        
    respond_to do |format|
        format.xml
    end
        
  end

# Get http://consultarrepuestos/:descripcion
  def consultar_repuestos
    i_repuesto = params[:descripcion]

    # url_repuesto = "http://localhost:3000/consultar_repuestos.xml"
    url_repuesto = "http://localhost:3000/images/repuestos.xml"
    puts url_repuesto
    repuestos_doc = Nokogiri::XML(open(url_repuesto))


    repuestos_nodos = repuestos_doc.css("producto")
    @nombre = Array.new
    @codigo = Array.new
    @repuestos = []
    repuestos_nodos.each do |repuesto|
      @repuestos <<  {:codigo => repuesto.css('codigo').text, :descrip => repuesto.css('descripcion').text }
      @codigo << repuesto.css('codigo').text
      @nombre << repuesto.css('descripcion').text
    end
         
    respond_to do |format|
       format.xml
    end
          
  end
    
  # GET http://localhost:3000/agregarservicio/123/456.xml
  def create_servicio
    i_orden_id = params[:orden_id]
    i_servicio_id = params[:servicio_id]

    #revisar que orden exista    
    if (@orden = Orden.find(i_orden_id))

      #pedir description del servicio
      url_servicio = "http://localhost:3001/servicio_nombre/#{i_servicio_id}.xml"
      puts url_servicio
      servicio = Nokogiri::XML(open(url_servicio))

      if servicio.at_css('error').nil?
        nombre = servicio.at_css('nombre').text
       
        @ordendetalle = Ordendetalle.new(:orden_id => @orden.id,
                                         :servicio_id => i_servicio_id,
                                         :descripcion => nombre)
        unless @ordendetalle.save
          @error_code = 500
          @error_description = "Error al agregar servicio. #{@ordendetalle.errors}"
          logger.debug { "Error: #{@ordendetalle.errors}" }
        end
      else
        @error_code = 500
        @error_description = "Error al obtener servicio."
      end
    else
      @error_code = 500
      @error_description = "Numero de orden invalido."
    end

    respond_to do |format|
      format.xml
    end
    
  end
  
  # GET http://localhost:3000/recibirvehiculo/123.xml
  # cita_id = 123
  def create_orden
    i_cita_id = params[:cita_id]

    @cita = Cita.where("id = ?", i_cita_id)
    if @cita.empty?
      @error_code = 500
      @error_description = "Numero de cita invalido"
    else
      #buscar si ya existe
      @orden = Orden.where(:cita_id => @cita[0].id)
      
      if @orden.empty?
        #crear orden
        @orden = Orden.new(:cita_id => @cita[0].id,
                           :estado_id => Orden::ESTADO_RECIBIDO)

        unless @orden.save
          @error_code = 500
          @error_description = "Error al crear orden. #{@orden.errors}"       
        end
        
      else
        @error_code = 500
        @error_description = "Cita ya ha sido ingresada."
      end
      
    end

    respond_to do |format|
      format.xml
    end
    
  end


  # GET http://localhost:3000/nuevacita/122brw/31-12-2010/15.xml
  # placa = 122brw
  # fecha = 31-12-2010
  # hora = 15 ~= 3PM
  def create_cita

    c_placa = params[:placa].upcase
    c_fecha = params[:fecha]
    c_hora = params[:hora]
    
    # buscar si vehiculo existe
    @vehiculo = Vehiculo.find_by_placa(c_placa)

    if @vehiculo.nil?
      #crear nuevo vehiculo
      @vehiculo = Vehiculo.new(:placa => c_placa)
      unless @vehiculo.save
        @error_code = 500
        @error_description = "Error al crear vehiculo. #{@vehiculo.errors}"
      end            
    end

    @cita = Cita.new(:fecha => Date.parse(c_fecha),
                     :hora => c_hora.to_i,
                     :cliente_id => @vehiculo.id,
                     :estados_id => 1)

    unless @cita.save
      @error_code = 500
      @error_description = "Error al crear cita. #{@cita.errors}"
    end

    respond_to do |format|
      format.xml
    end
    
  end

  # GET http://locahost:3000/consultarfechahora/31-12-2010/15.xml
  # GET http://locahost:3000/consultafecha/31-12-2010list.xml
  # fecha = 31-12-2010
  # hora = 15 ~= 3PM
  def find_cita
    d_fecha = Date.parse(params[:fecha])

    unless params[:hora].nil?      
      i_hora = params[:hora].to_s
      # i_hora = params[:hora].to_i
      citas = Cita.where("fecha = ? and hora = ?", d_fecha, i_hora)
      # citas = Cita.where("fecha = ? and hora = ?", d_fecha, i_hora).count
      # 1 : ocupado
      # 0 : libre
      @disponible = citas > 0 ? 'false' : 'true'
    else
      citas = Cita.select('hora').where("fecha = ?", d_fecha)

      @horaslibres = ["0800","0830", "0900","0930", "1000", "1030", "1100", "1130", "1200", "1230", "1300","1330", "1400", "1430", "1500","1530", "1600","1630"]
      for cita in citas
        @horaslibres.delete(cita.hora)
      end
    end
    

    respond_to do |format|
      format.xml
    end
  end

end
