class Api::TypesController < ApplicationController
  include ActiveStorage::SetCurrent
  protect_from_forgery with: :null_session
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  before_action :set_type, only: [:show]

  def index
    types = Type.all
    render json: types, each_serializer: Api::TypeSerializer
  end

  def show
    render json: @type, serializer: Api::TypeWithSongsSerializer
  end


  private
  def set_type
    @type = Type.find(params[:id])
  end


end
