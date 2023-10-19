class Api::SingersController < ApplicationController
  include ActiveStorage::SetCurrent
  protect_from_forgery with: :null_session
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  before_action :set_singer, only: [:show]

  def index
    singers = Singer.all
    render json: singers, each_serializer: Api::SingerSerializer
  end

  def show
    render json: @singer, serializer: Api::SingerWithSongsSerializer
  end


  private
  def set_singer
    @singer = Singer.find(params[:id])
  end
end
