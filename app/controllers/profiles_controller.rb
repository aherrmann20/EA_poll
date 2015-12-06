class ProfilesController < ApplicationController
	def new
		@profile = Profile.new
	end

	def index
		@profiles = Profile.all
	end

	def create
		@profile = Profile.new(profile_params)
		@profile.user = current_user

		if @profile.save
			redirect_to profile_path(@profile)
		else
			render 'new'
		end
	end

	def show
		@profile = Profile.find params[:id]
	end

	def edit
		@profile = Profile.find(params[:id])
	end

	def update
		@profile = Profile.find(params[:id])
		if @profile.update(profile_params)
			redirect_to profile_path(@profile), notice: "Your profile was successfullly updated."
		else
			render 'edit'
		end
	end

	def destroy
		@profile = Profile.find params[:id]
		@profile.destroy

		redirect_to root_path
	end

	private
	def profile_params
		params.require(:profile).permit(:name, :surname, :age, :description, :user_id, :photo)
	end

end
