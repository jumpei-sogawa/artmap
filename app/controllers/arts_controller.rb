class ArtsController < ApplicationController
  before_action :set_art, only: [:show, :edit, :update, :destroy]
  impressionist :actions=> [:index, :show]

  # GET /arts
  # GET /arts.json
  def index
    @arts = Art.all.order("id DESC")
    @addresses = []
    @latitudes = []
    @longitudes = []
    @arts.each do |art|
      @addresses << art.address
      @latitudes << art.latitude
      @longitudes << art.longitude
    end

    @artists = Artist.all
  end

  # GET /arts/1
  # GET /arts/1.json
  def show
    # @art = Map.find_by(id: params[:id])
    @address = @art.address
    @latitude = @art.latitude
    @longitude = @art.longitude
  end

  # GET /arts/new
  def new
    @art = Art.new
    @artists = Artist.all
  end

  # GET /arts/1/edit
  def edit
    @artists = Artist.all
  end

  # POST /arts
  # POST /arts.json
  def create
    @art = Art.new(art_params)
    @art.geocoded_by_strv

    respond_to do |format|
      if @art.save
        format.html { redirect_to @art, notice: 'Art was successfully created.' }
        format.json { render :show, status: :created, location: @art }
      else
        format.html { render :new }
        format.json { render json: @art.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /arts/1
  # PATCH/PUT /arts/1.json
  def update
    @art.geocoded_by_strv
    
    respond_to do |format|
      if @art.update(art_params)
        format.html { redirect_to @art, notice: 'Art was successfully updated.' }
        format.json { render :show, status: :ok, location: @art }
      else
        format.html { render :edit }
        format.json { render json: @art.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /arts/1
  # DELETE /arts/1.json
  def destroy
    @art.destroy
    respond_to do |format|
      format.html { redirect_to arts_url, notice: 'Art was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_art
      @art = Art.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def art_params
      params.require(:art).permit(:artist_id, :title, :year, :image_link, :image, :location_link, :address, :latitude, :longitude, :view_link)
    end
end
