class Api::V1::GreetingsController < ApplicationController
  # This is a before action that is called before the show, update, and destroy actions. It is setting the @greeting
  # variable to the greeting that is being requested.
  before_action :set_greeting, only: [:show, :update, :destroy]

 # The index function is a GET request that returns all the greetings in the database
  def index
    @greetings = Greeting.all
    render json: @greetings
  end

  # The show function is a GET request that returns a single greeting from the database
  def show
    render json: @greeting
  end

  # The create function is a POST request that creates a new greeting in the database
  def create
    @greeting = Greeting.new(greeting_params)
    if @greeting.save
      render json: @greeting, status: :created, location: @greeting
    else
      render json: @greeting.errors, status: :unprocessable_entity
    end
  end

  # The update function is a PUT request that updates a greeting in the database
  def update
    if @greeting.update(greeting_params)
      render json: @greeting
    else
      render json: @greeting.errors, status: :unprocessable_entity
    end
  end

  # The destroy function is a DELETE request that deletes a greeting from the database
  def destroy
    @greeting.destroy
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
