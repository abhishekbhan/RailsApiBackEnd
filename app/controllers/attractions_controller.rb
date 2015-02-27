class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :update, :destroy]

  # GET /attractions
  # GET /attractions.json
  # def index
  #   # @client = GooglePlaces::Client.new(AIzaSyCoKHlYL3S90jKTEUZGMceScKavoR9FSQ0)
  #   # results = @client.spots_by_query(search)

  #   # render json: results
  # end
  # def new
  #   # @result = 

  #   response =
  # HTTParty.get("http://rubygems.org/api/v1/versions/httparty.json")
  # end
  # GET /attractions/1
  # GET /attractions/1.json
  def show
    # render json: @attraction
    photos = @attraction.photos
    render json: { attraction: @attraction, photos: photos }
    
  end

  # POST /attractions
  # POST /attractions.json
  def create
    @vacation = Vacation.find(params[:vacation_id])
    @attraction = Attraction.new(attraction_params)
      # , vacation_id: params[:vacation_id])

    if @attraction.save
      render json: @attraction, status: :created, :location => vacation_attraction_path(@vacation , @attraction)
    else
      render json: @attraction.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /attractions/1
  # PATCH/PUT /attractions/1.json
  # def update
  #   @attraction = Attraction.find(params[:id])

  #   if @attraction.update(attraction_params)
  #     head :no_content
  #   else
  #     render json: @attraction.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /attractions/1
  # DELETE /attractions/1.json
  def destroy
    @attraction.destroy

    head :no_content
  end

  private

    def set_attraction
      @attraction = Attraction.find(params[:id])
    end

    def attraction_params
      params.require(:attraction).permit(:name, :location, :url, :vacation_id)
    end
end
