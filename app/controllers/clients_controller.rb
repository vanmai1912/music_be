class ClientsController < ApplicationController
    before_action :set_client, only: %i[ show edit update destroy ]
  
    def index
      @clients = User.where(role: true)
    end
  
    def show
    end
  
    def new
      @client = User.new
    end
  
    def edit
    end
  
    # POST /singers or /singers.json
    def create
      byebug
      @client = User.new(client_params_create)
      @client.active = 1
      @client.role = 1
      
      respond_to do |format|
        if @client.save
          format.html { redirect_to clients_url, notice: "Client was successfully created." }
          format.json { render :show, status: :created, location: @client }
          flash[:notice] = "Client was successfully created."
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @client.errors, status: :unprocessable_entity }
          flash[:notice] = "Client was fail created."
        end
      end
      
    end
  
    # PATCH/PUT /singers/1 or /singers/1.json
    def update
      respond_to do |format|
        if params[:change_client_password].present?
          if @client.update(client_params_password)
            format.html { redirect_to clients_url, notice: "Client was successfully updated password." }
            format.json { render :show, status: :ok, location: @client }
            flash[:notice] = "Client was successfully updated password."
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @client.errors, status: :unprocessable_entity }
            flash[:notice] = "Client was successfully updated fail."
          end
        else
          if @client.update(client_params)
            format.html { redirect_to clients_url, notice: "Client was successfully updated information." }
            format.json { render :show, status: :ok, location: @client }
            flash[:notice] = "Client was successfully updated information."
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @client.errors, status: :unprocessable_entity }
            flash[:notice] = "Client was successfully updated fail."
          end
        end
        
      end
      
    end
  
    # DELETE /singers/1 or /singers/1.json
    def destroy
      # @singer.destroy
  
      # respond_to do |format|
      #   format.html { redirect_to singers_url, notice: "Singer was successfully destroyed." }
      #   format.json { head :no_content }
      # end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_client
        @client = User.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def client_params
        params.require(:user).permit(:email, :first_name, :last_name, :phone, :avatar)
      end

      def client_params_create
        params.require(:user).permit(:email, :first_name, :last_name, :phone, :avatar, :password, :password_confirmation)
      end

      def client_params_password
        params.require(:user).permit(:password, :password_confirmation)
      end


  
end
