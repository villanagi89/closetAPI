class ClosetsController < ApplicationController
  before_action :set_closet, only: [:show, :update, :destroy]

  # GET /closets
  # GET /closets.json
  def index
    @closets = Closet.all

    render json: @closets
  end

  # GET /closets/1
  # GET /closets/1.json
  def show
    render json: @closet
  end

  # POST /closets
  # POST /closets.json
  def create
    @closet = Closet.new(closet_params)

    if @closet.save
      render json: @closet, status: :created, location: @closet
    else
      render json: @closet.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /closets/1
  # PATCH/PUT /closets/1.json
  def update
    @closet = Closet.find(params[:id])

    if @closet.update(closet_params)
      head :no_content
    else
      render json: @closet.errors, status: :unprocessable_entity
    end
  end

  # DELETE /closets/1
  # DELETE /closets/1.json
  def destroy
    @closet.destroy

    head :no_content
  end

  private

    def set_closet
      @closet = Closet.find(params[:id])
    end

    def closet_params
      params.require(:closet).permit(:name, :user_id)
    end
end
