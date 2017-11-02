class JobsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_job, only: [:show, :update, :destroy, :edit]
	def index
		@jobs = Job.all
	end

  def show
  end

  def new
  @job = Job.new
  end

	def edit
		# @job = Job.find(params[:id])
	end

  def create
		@job = Job.new(job_params)
		@job.user = current_user
		respond_to do |format|
			if @job.save
				format.html { redirect_to @job, notice: 'Job was successfully created.' }
      else
        format.html { render :new }
			end
		end
  end

  def update
		respond_to do |format|
			if @job.update(job_params)
				format.html {redirect_to @job, notice: 'Job was successfully updated.'}
				format.json { render :show, status: :ok, location: @job }
			else
				format.html { render :edit }
			end
    end
  end

  def destroy
		@job.destroy if @job.id == session[:job_id]
		session[:job_id] = nil
		respond_to do |format|
      format.html { redirect_to boats }
		end
  end


	# Provide a list of the boats  assinged to the job
	def assign
		@job = Job.find(params[:id])
	end

  private
		def set_job
      @job = Job.find(params[:id])
		end

    def job_params
       params.require(:job).permit(:name, :description, :origin, :destination, :cost, :containers, :boat)
    end
end
