class Api::V1::DogCollectablesController < ApplicationController
  before_action :set_dog_collectable, only: [:show,:update,:destroy]

  def index
    dog_collectables = DogCollectable.all
    render json: dog_collectables, status: 200
  end

  def create
    dog_collectable = DogCollectable.create(dog_collectable_params)
    render json: dog_collectable, status: 201
  end

  def update
    @dog_collectable.update(dog_collectable_params)
    render json: @dog_collectable, status: 200
  end

  def destroy
    dog_collectableId = @dog_collectable.id
    @dog_collectable.destroy
    render json: {message:"Zap! DogCollectable deleted", dog_collectableId:dog_collectableId}
  end

  def show
    render json: @dog_collectable, status: 200
  end

  private
  def dog_collectable_params
    params.permit(:name, :img, :location_id)
  end

  def set_dog_collectable
    @dog_collectable = DogCollectable.find(params[:id])
  end
end
