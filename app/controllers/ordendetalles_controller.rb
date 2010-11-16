class OrdendetallesController < ApplicationController
  # GET /ordendetalles
  # GET /ordendetalles.xml
  def index
    @ordendetalles = Ordendetalle.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ordendetalles }
    end
  end

  # GET /ordendetalles/1
  # GET /ordendetalles/1.xml
  def show
    @ordendetalle = Ordendetalle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ordendetalle }
    end
  end

  # GET /ordendetalles/new
  # GET /ordendetalles/new.xml
  def new
    @ordendetalle = Ordendetalle.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ordendetalle }
    end
  end

  # GET /ordendetalles/1/edit
  def edit
    @ordendetalle = Ordendetalle.find(params[:id])
  end

  # POST /ordendetalles
  # POST /ordendetalles.xml
  def create
    @ordendetalle = Ordendetalle.new(params[:ordendetalle])

    respond_to do |format|
      if @ordendetalle.save
        format.html { redirect_to(@ordendetalle, :notice => 'Ordendetalle was successfully created.') }
        format.xml  { render :xml => @ordendetalle, :status => :created, :location => @ordendetalle }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ordendetalle.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ordendetalles/1
  # PUT /ordendetalles/1.xml
  def update
    @ordendetalle = Ordendetalle.find(params[:id])

    respond_to do |format|
      if @ordendetalle.update_attributes(params[:ordendetalle])
        format.html { redirect_to(@ordendetalle, :notice => 'Ordendetalle was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ordendetalle.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ordendetalles/1
  # DELETE /ordendetalles/1.xml
  def destroy
    @ordendetalle = Ordendetalle.find(params[:id])
    @ordendetalle.destroy

    respond_to do |format|
      format.html { redirect_to(ordendetalles_url) }
      format.xml  { head :ok }
    end
  end
end
