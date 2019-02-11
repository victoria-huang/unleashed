class Api::V1::NpcsController < ApplicationController
  before_action :set_npc, only: [:show, :update, :destroy]

  def index
    npcs = Npc.all
    render json: npcs, status: 200
  end

  def create
    npc = Npc.create(npc_params)
    render json: npc, status: 201
  end

  def update
    @npc.update(npc_params)
    render json: @npc, status: 200
  end

  def destroy
    npcId = @npc.id
    @npc.destroy
    render json: {message:"Zap! npc deleted", npcId:npcId}
  end

  def show
    render json: @npc, status: 200
  end

  private
  def npc_params
    params.permit(:name, :dialogue, :img, :location_id)
  end

  def set_npc
    @npc = Npc.find(params[:id])
  end
end
