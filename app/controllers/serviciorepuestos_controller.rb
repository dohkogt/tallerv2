class ServiciorepuestosController < ApplicationController
  # GET /serviciorepuestos
  # GET /serviciorepuestos.xml
  def index
    @serviciorepuestos = Serviciorepuesto.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @serviciorepuestos }
    end
  end

  # GET /serviciorepuestos/1
  # GET /serviciorepuestos/1.xml
  def show
    @serviciorepuesto = Serviciorepuesto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @serviciorepuesto }
    end
  end

  # GET /serviciorepuestos/new
  # GET /serviciorepuestos/new.xml
  def new
    @serviciorepuesto = Serviciorepuesto.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @serviciorepuesto }
    end
  end

  # GET /serviciorepuestos/1/edit
  def edit
    @serviciorepuesto = Serviciorepuesto.find(params[:id])
  end

  # POST /serviciorepuestos
  # POST /serviciorepuestos.xml
  def create
    @serviciorepuesto = Serviciorepuesto.new(params[:serviciorepuesto])

    respond_to do |format|
      if @serviciorepuesto.save
        format.html { redirect_to(@serviciorepuesto, :notice => 'Serviciorepuesto was successfully created.') }
        format.xml  { render :xml => @serviciorepuesto, :status => :created, :location => @serviciorepuesto }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @serviciorepuesto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /serviciorepuestos/1
  # PUT /serviciorepuestos/1.xml
  def update
    @serviciorepuesto = Serviciorepuesto.find(params[:id])

    respond_to do |format|
      if @serviciorepuesto.update_attributes(params[:serviciorepuesto])
        format.html { redirect_to(@serviciorepuesto, :notice => 'Serviciorepuesto was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @serviciorepuesto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /serviciorepuestos/1
  # DELETE /serviciorepuestos/1.xml
  def destroy
    @serviciorepuesto = Serviciorepuesto.find(params[:id])
    @serviciorepuesto.destroy

    respond_to do |format|
      format.html { redirect_to(serviciorepuestos_url) }
      format.xml  { head :ok }
    end
  end
end
