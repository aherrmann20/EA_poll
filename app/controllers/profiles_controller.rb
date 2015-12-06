class ProfilesController < ApplicationController
	# defines new method and defines instance variable @profile to be used in views/profiles/new
	def new
		@profile = Profile.new
	end

	# defines index method and defines instance variable @profiles (an array) to be used in views/profiles/index
	def index
		@profiles = Profile.all
	end

	# defines new method and defines instance variable @profile. Create will take the data inputted in the "new" form
  	# and create a new profile. After a successful update, the app will redirect to the profile created (given by profile_path
  	# via rake routes. Flash message is passed to javascript.)
	def create
		@profile = Profile.new(profile_params)
		@profile.user = current_user

		if @profile.save
			redirect_to profile_path(@profile)
		else
			render 'new'
		end
	end

	# defines show method and defines instance variable @profile to be used in views/profiles/show
	def show
		@profile = Profile.find params[:id]
	end

	# defines edit method and defines instance variable @profile to be used in views/profiles/edit
	def edit
		@profile = Profile.find(params[:id])
	end

  	# defines update method and defines instance variable @profile. Update will take the data inputted in the "edit" form
	# and update an existing profile. After a successful update, the app will redirect to the updated profile 
	# Flash message is passed to javascript.
	def update
		@profile = Profile.find(params[:id])
		if @profile.update(profile_params)
			redirect_to profile_path(@profile), notice: "Your profile was successfullly updated."
		else
			render 'edit'
		end
	end

  # defines destroy method and defines instance variable @proifle. Profile will be destroyed from database and
  # the app will redirect to the home page.
  # Flash message is passed to javascript.)
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
