class PollsController < ApplicationController
  before_action :authenticate_user!

  def new
    @poll = Poll.new
  end

  def index
    @polls = Poll.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
  end

  def create
    @poll = Poll.new(poll_params)
    @poll.user = current_user
    if @poll.save
      redirect_to root_path and return
    end
    render action: :new
  end

  def show
    @poll = Poll.find(params[:id])
    @multiple = @poll.multiple_options
  end

  def update
    @poll = Poll.find(params[:id])
    if params[:options]
      chosen_options = @poll.options.find(params[:options])
      unless current_user.vote!(chosen_options, @poll)
        flash.now[:error] = 'Something went wrong'
      end
    else
      flash.now[:error] = 'Choose at least one option'
    end
    render :show
  end

  private

  def poll_params
    params.require(:poll).permit(:name, :multiple_options, options_attributes: [:id, :name, :_destroy])
  end
end
