class JobsController < ApplicationController

        @jobs = Job.all
        class BoatsController < ApplicationController
  before_action :set_boat, only: [:show, :edit, :update, :destroy]

  # GET /boats
  # GET /boats.json
  def index
    @jobs = Job.all
  end

  # GET /boats/1
  # GET /boats/1.json
  def show
  end

  # GET /boats/new
  def new
    @job = Job.new
  end

  # GET /boats/1/edit
  def edit
  end

  # POST /boats
  # POST /boats.json
  def create
    @job = Job.new(boat_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job}
      else
        format.html { render :new }
        format.json { render json: @boat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boats/1
  # PATCH/PUT /boats/1.json
  def update
    respond_to do |format|
      if @boat.update(boat_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @boat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boats/1
  # DELETE /boats/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to boats_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @boat = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:description, :origin, :destination, :cost, :containers)
    end
end

end
end
