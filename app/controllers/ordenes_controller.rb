class OrdenesController < ApplicationController
  # GET /ordenes
  # GET /ordenes.xml
  def index
    @ordenes = Orden.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ordenes }
    end
  end

  # GET /ordenes/1
  # GET /ordenes/1.xml
  def show
    @orden = Orden.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @orden }
    end
  end

  # GET /ordenes/new
  # GET /ordenes/new.xml
  def new
    @orden = Orden.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @orden }
    end
  end

  # GET /ordenes/1/edit
  def edit
    @orden = Orden.find(params[:id])
  end

  # POST /ordenes
  # POST /ordenes.xml
  def create
    @orden = Orden.new(params[:orden])

    respond_to do |format|
      if @orden.save
        format.html { redirect_to(@orden, :notice => 'Orden was successfully created.') }
        format.xml  { render :xml => @orden, :status => :created, :location => @orden }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @orden.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ordenes/1
  # PUT /ordenes/1.xml
  def update
    @orden = Orden.find(params[:id])

    respond_to do |format|
      if @orden.update_attributes(params[:orden])
        format.html { redirect_to(@orden, :notice => 'Orden was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @orden.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ordenes/1
  # DELETE /ordenes/1.xml
  def destroy
    @orden = Orden.find(params[:id])
    @orden.destroy

    respond_to do |format|
      format.html { redirect_to(ordenes_url) }
      format.xml  { head :ok }
    end
  end
end
