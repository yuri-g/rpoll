class HomeController < ApplicationController
  def welcome
    @polls = Poll.all
  end
end
