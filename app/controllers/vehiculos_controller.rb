class VehiculosController < ApplicationController
  # GET /vehiculos
  # GET /vehiculos.xml
  def index
    @vehiculos = Vehiculo.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @vehiculos }
    end
  end

  # GET /vehiculos/1
  # GET /vehiculos/1.xml
  def show
    @vehiculo = Vehiculo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @vehiculo }
    end
  end

  # GET /vehiculos/new
  # GET /vehiculos/new.xml
  def new
    @vehiculo = Vehiculo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @vehiculo }
    end
  end

  # GET /vehiculos/1/edit
  def edit
    @vehiculo = Vehiculo.find(params[:id])
  end

  # POST /vehiculos
  # POST /vehiculos.xml
  def create
    @vehiculo = Vehiculo.new(params[:vehiculo])

    respond_to do |format|
      if @vehiculo.save
        format.html { redirect_to(@vehiculo, :notice => 'Vehiculo was successfully created.') }
        format.xml  { render :xml => @vehiculo, :status => :created, :location => @vehiculo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @vehiculo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /vehiculos/1
  # PUT /vehiculos/1.xml
  def update
    @vehiculo = Vehiculo.find(params[:id])

    respond_to do |format|
      if @vehiculo.update_attributes(params[:vehiculo])
        format.html { redirect_to(@vehiculo, :notice => 'Vehiculo was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @vehiculo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /vehiculos/1
  # DELETE /vehiculos/1.xml
  def destroy
    @vehiculo = Vehiculo.find(params[:id])
    @vehiculo.destroy

    respond_to do |format|
      format.html { redirect_to(vehiculos_url) }
      format.xml  { head :ok }
    end
  end
end
