class SingersController < ApplicationController
  before_action :set_singer, only: %i[ show edit update destroy ]

  # GET /singers or /singers.json
  def index
    @singers = Singer.all
  end

  # GET /singers/1 or /singers/1.json
  def show
  end

  # GET /singers/new
  def new
    @singer = Singer.new
  end

  # GET /singers/1/edit
  def edit
  end

  # POST /singers or /singers.json
  def create
    @singer = Singer.new(singer_params)

    respond_to do |format|
      if @singer.save
        format.html { redirect_to singers_url, notice: "Singer was successfully created." }
        format.json { render :show, status: :created, location: @singer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @singer.errors, status: :unprocessable_entity }
      end
    end
    flash[:notice] = "Singer was successfully created."
  end

  # PATCH/PUT /singers/1 or /singers/1.json
  def update
    respond_to do |format|
      if @singer.update(singer_params)
        format.html { redirect_to singers_url, notice: "Singer was successfully updated." }
        format.json { render :show, status: :ok, location: @singer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @singer.errors, status: :unprocessable_entity }
      end
    end
    flash[:notice] = "Singer was successfully updated."
  end

  # DELETE /singers/1 or /singers/1.json
  def destroy
    @singer.destroy

    respond_to do |format|
      format.html { redirect_to singers_url, notice: "Singer was successfully destroyed." }
      format.json { head :no_content }
    end
    flash[:notice] = "Singer was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_singer
      @singer = Singer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def singer_params
      params.require(:singer).permit(:name, :genre, :description, :avatar)
    end
end
