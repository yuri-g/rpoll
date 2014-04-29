class PollsController < ApplicationController
  def new
    @poll = Poll.new
  end

  def create
    @poll = Poll.new(poll_params)
    if @poll.save
      redirect_to root_path and return
    end
    render action: :new
  end

  private

  def poll_params
    params.require(:poll).permit(:name, :multiple_options, options_attributes: [:id, :name, :_destroy])
  end
end
