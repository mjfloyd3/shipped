class BoatsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_boat, only: [:show, :edit, :update, :destroy, :start]


  # GET /boats
  # GET /boats.json
  def index
    @boats = Boat.all
  end

  # GET /boats/1
  # GET /boats/1.json
  def show
  end

  # List jobs a boat is in:
  def jobs
    @boat = Boat.find(params[:id])
    @boats = @boat.jobs
  end

  # GET /boats/new
  def new
    @boat = current_user.boats.build
  end

  # GET /boats/1/edit
  def edit
  end

  # POST /boats
  def create
    @boat = current_user.boats.build(boat_params)
    respond_to do |format|
      if @boat.save
        format.html { redirect_to @boat, notice: 'Boat was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def job_add
    # convert ids from routing to objects
    @boat = Boat.find(params[:id])
    @job = Job.find(params[:job])

    unless @boat.assigned_in?(@job)
      #adds the job to list of jobs for current boat
      @boat.jobs << @job
      flash[:notice] = 'Job was assigned!'
    else
      flash[:error] = 'FAILED TO ASSIGN'
    end

    redirect_to action: "jobs", id: @boat
  end

  # Removing a boat from a job_id
  def job_remove
    @boat = Boat.find(params[:id])
    job_ids = params[:jobs]
    if job_ids.any?

      job_ids.each do |course_id|
        job = Job.find(job_ids)
        if @boat.assigned_in?(job)
          logger.info "Removing boat from job #{job.id}"
          @boat.jobs.delete(job)
          flash[:notice] = 'Job was deleted'
        end
      end
    end

    redirect_to action: "Jobs", id: @boat
  end




  def start
    @boat = Boat.find(params[:id])
    @boat.update(started_at: Time.zone.now)
  end





  # PATCH/PUT /boats/1
  # PATCH/PUT /boats/1.json
  def update
    respond_to do |format|
      if @boat.update(boat_params)
        format.html { redirect_to @boat, notice: 'Boat was successfully updated.' }
        format.json { render :show, status: :ok, location: @boat }
      else
        format.html { render :edit }
        format.json { render json: @boat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boats/1
  # DELETE /boats/1.json
  def destroy
    @boat.destroy
    respond_to do |format|
      format.html { redirect_to boats_url, notice: 'Boat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  # taks boat id and single job id and adds the boat to that job

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_boat
      @boat = Boat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def boat_params
      params.require(:boat).permit(:name, :containers, :location, :image)
    end
end
