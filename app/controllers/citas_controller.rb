class CitasController < ApplicationController
  
  def index
    @citas = Cita.find :all
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @citas }
    end
  end

  def show
    @cita = Cita.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cita }
    end
  end

  def new
    @cita = Cita.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cita }
    end
  end

  def edit
    @cita = Cita.find(params[:id])
  end

  def create
    @cita = Cita.new(params[:cita])
    
    respond_to do |format|
      if @cita.save
        flash[:notice] = 'Cita was successfully created.'
        format.html { redirect_to(@cita) }
        format.xml  { render :xml => @cita, :status => :created, :location => @cita }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cita.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @cita = Cita.find(params[:id])
    
    respond_to do |format|
      if @cita.update_attributes(params[:cita])
        flash[:notice] = 'Cita was successfully updated.'
        format.html { redirect_to(@cita) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cita.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @cita = Cita.find(params[:id])
    @cita.destroy
    
    respond_to do |format|
      format.html { redirect_to(citas_url) }
      format.xml  { head :ok }
    end
  end

  

end
