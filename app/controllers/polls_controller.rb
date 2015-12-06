class PollsController < ApplicationController

  # defines index method and defines instance variable @polls (an array) to be used in views/polls/index
  def index
    @polls = Poll.all
  end

  # defines new method and defines instance variable @poll to be used in views/polls/new
  def new
    @poll = Poll.new
  end

  # defines new method and defines instance variable @poll. Create will take the data inputted in the "new" form
  # and create a new poll. After a successful update, the app will redirect to the polls index (given by polls_path
  # via rake routes. Flash message is passed to javascript.)
  def create
    @poll = Poll.new(poll_params)
    if @poll.save
      flash[:success] = 'Poll was created!'
      redirect_to polls_path
    else
      render 'new'
    end
  end

  # defines edit method and defines instance variable @poll to be used in views/polls/edit
  def edit
    @poll = Poll.find_by_id(params[:id])
  end

  # defines show method and defines instance variable @poll to be used in views/polls/show
  def show
    @poll = Poll.includes(:vote_options).find_by_id(params[:id])
  end

  # defines update method and defines instance variable @poll. Update will take the data inputted in the "edit" form
  # and update an existing poll. After a successful update, the app will redirect to the polls index (given by polls_path
  # via rake routes. Flash message is passed to javascript.)
  def update
    @poll = Poll.find_by_id(params[:id])
    if @poll.update_attributes(poll_params)
      flash[:success] = 'Poll was updated!'
      redirect_to polls_path
    else
      render 'edit'
    end
  end

  # defines destroy method and defines instance variable @poll. Poll will be destroyed from database and
  # the app will redirect to the polls index (given by polls_path via rake routes.)
  # Flash message is passed to javascript.)
  def destroy
    @poll = Poll.find_by_id(params[:id])
    if @poll.destroy
      flash[:success] = "Poll was destroyed!"
    else
      flash[:warning] = "Error destroying poll"
    end
    redirect_to polls_path
  end

  private

  # defines the paramaters allowed and required to work with a poll, including the nested vote_options attributes
  def poll_params
    params.require(:poll).permit(:topic, :open, vote_options_attributes: [:id, :title, :_destroy, :correct])
  end
end