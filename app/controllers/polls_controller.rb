class PollsController < ApplicationController
  before_action :authenticate_user!

  def new
    @poll = Poll.new
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
    @votes = Array.new(@poll.options.count) { @poll.votes.build }
  end

  def update
    @poll = Poll.find(params[:id])
    chosen_options = @poll.options.find(params[:options])
    chosen_options.each do |option|
      Vote.create(user: current_user, option: option, poll: @poll)
    end
    render json: chosen_options
  end

  private

  def poll_params
    params.require(:poll).permit(:name, :multiple_options, options_attributes: [:id, :name, :_destroy])
  end
end
