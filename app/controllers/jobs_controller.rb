class JobsController < ApplicationController
	before_action :authenticate_user!

    def index
        @jobs = Job.all
    end

    def show
    end

    def new
    	job = Job.new 
    end

	def edit
        @job = Job.find(params[:id])
    end

    def create
    @boat = Job.new(boat_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @boat.errors, status: :unprocessable_entity }
      end
    end

    def update
        respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
      end
    end
  end

    def destroy
        Job.delete(params[:id])
        redirect_to url_for(:controller => :jobs, :action => :index)
    end


    private

    def set_job
      @job = Job.find(params[:id])
    end

    def job_params
       params.require(:job).permit(:description, :origin, :destination, :cost) 
    end
end
end

