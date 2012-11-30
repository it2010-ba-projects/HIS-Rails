class HardwarePartsController < ApplicationController
  load_and_authorize_resource
  
  # GET /hardware_parts
  # GET /hardware_parts.json
  def index
    @hardware_parts = HardwarePart.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hardware_parts }
    end
  end

  # GET /hardware_parts/1
  # GET /hardware_parts/1.json
  def show
    @hardware_part = HardwarePart.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hardware_part }
    end
  end

  # GET /hardware_parts/new
  # GET /hardware_parts/new.json
  def new
    @hardware_part = HardwarePart.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hardware_part }
    end
  end

  # GET /hardware_parts/1/edit
  def edit
    @hardware_part = HardwarePart.find(params[:id])
  end

  # POST /hardware_parts
  # POST /hardware_parts.json
  def create
    @hardware_part = HardwarePart.new(params[:hardware_part])

    respond_to do |format|
      if @hardware_part.save
        format.html { redirect_to @hardware_part, notice: 'Hardware was successfully created.' }
        format.json { render json: @hardware_part, status: :created, location: @hardware_part }
      else
        format.html { render action: "new" }
        format.json { render json: @hardware_part.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hardware_parts/1
  # PUT /hardware_parts/1.json
  def update
    @hardware_part = HardwarePart.find(params[:id])

    respond_to do |format|
      if @hardware_part.update_attributes(params[:hardware])
        format.html { redirect_to @hardware_part, notice: 'Hardware was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hardware_part.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hardware_parts/1
  # DELETE /hardware_parts/1.json
  def destroy
    @hardware_part = HardwarePart.find(params[:id])
    @hardware_part.destroy

    respond_to do |format|
      format.html { redirect_to hardware_parts_url }
      format.json { head :no_content }
    end
  end
end
