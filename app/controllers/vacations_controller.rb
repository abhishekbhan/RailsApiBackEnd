class VacationsController < ApplicationController
  before_action :set_vacation, only: [:show, :update, :destroy]

  # GET /vacations
  # GET /vacations.json
  def index
    # @user = current_user
    # @vacations = @user.vacations
    # @vacations = Vacation.find(user_id: current_user.id)
    @vacations = Vacation.all
    # byebug
    render json: @vacations
  end

  # GET /vacations/1
  # GET /vacations/1.json
  def show
    attractions = @vacation.attractions
    render json: { vacation: @vacation, attractions: attractions }
  end

  # POST /vacations
  # POST /vacations.json
  def create
    @vacation = Vacation.new(vacation_params)

    if @vacation.save
      render json: @vacation, status: :created, location: @vacation
    else
      render json: @vacation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vacations/1
  # PATCH/PUT /vacations/1.json
  # def update
  #   @vacation = Vacation.find(params[:id])

  #   if @vacation.update(vacation_params)
  #     head :no_content
  #   else
  #     render json: @vacation.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /vacations/1
  # DELETE /vacations/1.json
  def destroy
    @vacation.destroy

    head :no_content
  end

  private

    def set_vacation
      @vacation = Vacation.find(params[:id])
    end

    def vacation_params
      params.require(:vacation).permit(:name, :description, :user_id)
    end
end
