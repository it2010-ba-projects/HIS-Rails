class HardwareHistoryLogsController < ApplicationController
  # GET /hardware_history_logs
  # GET /hardware_history_logs.json
  def index
    @hardware_history_logs = HardwareHistoryLog.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hardware_history_logs }
    end
  end

  # GET /hardware_history_logs/1
  # GET /hardware_history_logs/1.json
  def show
    @hardware_history_log = HardwareHistoryLog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hardware_history_log }
    end
  end

  # GET /hardware_history_logs/new
  # GET /hardware_history_logs/new.json
  def new
    @hardware_history_log = HardwareHistoryLog.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hardware_history_log }
    end
  end

  # GET /hardware_history_logs/1/edit
  def edit
    @hardware_history_log = HardwareHistoryLog.find(params[:id])
  end

  # POST /hardware_history_logs
  # POST /hardware_history_logs.json
  def create
    @hardware_history_log = HardwareHistoryLog.new(params[:hardware_history_log])

    respond_to do |format|
      if @hardware_history_log.save
        format.html { redirect_to @hardware_history_log, notice: 'Hardware history log was successfully created.' }
        format.json { render json: @hardware_history_log, status: :created, location: @hardware_history_log }
      else
        format.html { render action: "new" }
        format.json { render json: @hardware_history_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hardware_history_logs/1
  # PUT /hardware_history_logs/1.json
  def update
    @hardware_history_log = HardwareHistoryLog.find(params[:id])

    respond_to do |format|
      if @hardware_history_log.update_attributes(params[:hardware_history_log])
        format.html { redirect_to @hardware_history_log, notice: 'Hardware history log was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hardware_history_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hardware_history_logs/1
  # DELETE /hardware_history_logs/1.json
  def destroy
    @hardware_history_log = HardwareHistoryLog.find(params[:id])
    @hardware_history_log.destroy

    respond_to do |format|
      format.html { redirect_to hardware_history_logs_url }
      format.json { head :no_content }
    end
  end
end
