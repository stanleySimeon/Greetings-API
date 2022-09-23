class Api::V1::GreetingsController < ApplicationController
  # This is a before action that is called before the show, update, and destroy actions. It is setting the @greeting
  # variable to the greeting that is being requested.
  before_action :set_greeting, only: %i[show]

  # The index function is a GET request that returns all the greetings in the database
  def index
    @greetings = Greeting.all.sample
  end

  # The show function is a GET request that returns a single greeting from the database
  def show
    render json: @greeting
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_greeting
    @greeting = Greeting.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def greeting_params
    params.require(:greeting).permit(:message)
  end
end
