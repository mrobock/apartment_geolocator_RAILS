class ApartmentsController < ApplicationController
  before_action :set_apartment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_owner!, except: [:show, :index, :all_map_locations, :map_location]

  # GET /apartments
  # GET /apartments.json
  def index
    @apartments = Apartment.all
  end

  def all_map_locations
    if !params[:search].blank?
      apartments = Apartment.search(params[:search][:search_string])
    else
      apartments = Apartment.all
    end
    @hash = Gmaps4rails.build_markers(apartments) do |apartment, marker|
      marker.lat(apartment.latitude)
      marker.lng(apartment.longitude)
      marker.infowindow("<em>" + apartment.full_street_address + "</em>")
    end
    render json: @hash.to_json
  end

  # GET /apartments/1
  # GET /apartments/1.json
  def show
  end

  def map_location
    @apartment = Apartment.find(params[:apartment_id])
    @hash = Gmaps4rails.build_markers(@apartment) do |apartment, marker|
      marker.lat(apartment.latitude)
      marker.lng(apartment.longitude)
      marker.infowindow("<em>" + apartment.full_street_address + "</em>")
    end
    render json: @hash.to_json
  end

  # GET /apartments/new
  def new
    @apartment = current_owner.apartments.build
  end

  # GET /apartments/1/edit
  def edit
  end

  def search
    @apartments = Apartment.search(params[:search])
  end

  # POST /apartments
  # POST /apartments.json
  def create
    @apartment = Apartment.new(apartment_params)

    respond_to do |format|
      if @apartment.save
        format.html { redirect_to @apartment, notice: 'Apartment was successfully created.' }
        format.json { render :show, status: :created, location: @apartment }
      else
        format.html { render :new }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apartments/1
  # PATCH/PUT /apartments/1.json
  def update
    respond_to do |format|
      if @apartment.update(apartment_params)
        format.html { redirect_to @apartment, notice: 'Apartment was successfully updated.' }
        format.json { render :show, status: :ok, location: @apartment }
      else
        format.html { render :edit }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apartments/1
  # DELETE /apartments/1.json
  def destroy
    @apartment.destroy
    respond_to do |format|
      format.html { redirect_to apartments_url, notice: 'Apartment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apartment
      @apartment = Apartment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apartment_params
      params.require(:apartment).permit(:street_1, :street_2, :city, :zip, :state, :country, :name, :phone_number, :availability, :image)
    end
end
