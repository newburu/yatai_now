class Admin::FestivalsController < Admin::BaseController
  before_action :authenticate_user!
  before_action :set_festival, only: %i[ show edit update destroy ]

  # GET /admin/festivals or /admin/festivals.json
  def index
    @festivals = Festival.all
  end

  # GET /admin/festivals/1 or /admin/festivals/1.json
  def show
  end

  # GET /admin/festivals/new
  def new
    @festival = Festival.new
  end

  # GET /admin/festivals/1/edit
  def edit
  end

  # POST /admin/festivals or /admin/festivals.json
  def create
    @festival = Festival.new(festival_params)

    respond_to do |format|
      if @festival.save
        format.html { redirect_to admin_festival_url(@festival), notice: "Festival was successfully created." }
        format.json { render :show, status: :created, location: @festival }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @festival.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/festivals/1 or /admin/festivals/1.json
  def update
    respond_to do |format|
      if @festival.update(festival_params)
        format.html { redirect_to admin_festival_url(@festival), notice: "Festival was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @festival }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @festival.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/festivals/1 or /admin/festivals/1.json
  def destroy
    @festival.destroy!

    respond_to do |format|
      format.html { redirect_to admin_festivals_path, notice: "Festival was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_festival
      @festival = Festival.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def festival_params
      params.require(:festival).permit(:name, :is_active, :allow_anonymous_map_updates)
    end
end
