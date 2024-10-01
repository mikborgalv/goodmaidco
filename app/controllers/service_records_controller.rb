class ServiceRecordsController < ApplicationController
  before_action :set_service_record, only: %i[ show edit update destroy ]

  # GET /service_records or /service_records.json
  def index
    @service_records = ServiceRecord.all
  end

  # GET /service_records/1 or /service_records/1.json
  def show
  end

  # GET /service_records/new
  def new
    @service_record = ServiceRecord.new
  end

  # GET /service_records/1/edit
  def edit
  end

  # POST /service_records or /service_records.json
  def create
    @service_record = ServiceRecord.new(service_record_params)

    respond_to do |format|
      if @service_record.save
        format.html { redirect_to @service_record, notice: "Service record was successfully created." }
        format.json { render :show, status: :created, location: @service_record }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @service_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /service_records/1 or /service_records/1.json
  def update
    respond_to do |format|
      if @service_record.update(service_record_params)
        format.html { redirect_to @service_record, notice: "Service record was successfully updated." }
        format.json { render :show, status: :ok, location: @service_record }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @service_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /service_records/1 or /service_records/1.json
  def destroy
    @service_record.destroy

    respond_to do |format|
      format.html { redirect_to service_records_path, status: :see_other, notice: "Service record was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_record
      @service_record = ServiceRecord.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def service_record_params
      params.require(:service_record).permit(:partner_id, :location_id, :date, :status)
    end
end
