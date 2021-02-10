class HotelsController < ApplicationController
  before_action :set_hotel, only: [:show, :edit, :update, :destroy]

  # GET /hotels
  # GET /hotels.json
  def index
    @hotels = Hotel.all
  end

  # GET /hotels/1
  # GET /hotels/1.json
  def show
  end

  # GET /hotels/new
  def new
    @hotel = Hotel.new
  end

  # GET /hotels/1/edit
  def edit
  end

  def access
    Hotel.find_by(id: params[:id]).update(active: params[:active])
    redirect_to hotels_path, notice:"updated successfully"
  end

  # POST /hotels
  # POST /hotels.json
  def create
    if current_user.hotels.first.present?
      redirect_to root_path, alert: "You can't create more than 1 hotel. Please contact to support. thanks"
    else
      @hotel = Hotel.new(hotel_params)
      respond_to do |format|
        if @hotel.save
          UserHotel.create(user_id: @hotel.user_id, hotel_id: @hotel.id)
          format.html { redirect_to root_path, notice: 'Hotel was successfully created. Please now start adding Menus' }
          format.json { render :index, status: :created, location: @hotel }
        else
          format.html { render :new }
          format.json { render json: @hotel.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /hotels/1
  # PATCH/PUT /hotels/1.json
  def update
    respond_to do |format|
      if @hotel.update(hotel_params)
        format.html { redirect_to hotels_url, notice: 'Hotel was successfully updated.' }
        format.json { render :index, status: :ok, location: @hotel }
      else
        format.html { render :edit }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hotels/1
  # DELETE /hotels/1.json
  def destroy
    @hotel.destroy
    respond_to do |format|
      format.html { redirect_to hotels_url, notice: 'Hotel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotel
      @hotel = Hotel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hotel_params
      params.require(:hotel).permit(:name, :contact, :address, :user_id)
    end
end
