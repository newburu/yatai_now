class Admin::FestivalsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_admin_festival, only: %i[ show edit update destroy ]

  # GET /admin/festivals or /admin/festivals.json
  def index
    @admin_festivals = Admin::Festival.all
  end

  # GET /admin/festivals/1 or /admin/festivals/1.json
  def show
  end

  # GET /admin/festivals/new
  def new
    @admin_festival = Admin::Festival.new
  end

  # GET /admin/festivals/1/edit
  def edit
  end

  # POST /admin/festivals or /admin/festivals.json
  def create
    @admin_festival = Admin::Festival.new(admin_festival_params)

    respond_to do |format|
      if @admin_festival.save
        format.html { redirect_to @admin_festival, notice: "Festival was successfully created." }
        format.json { render :show, status: :created, location: @admin_festival }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_festival.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/festivals/1 or /admin/festivals/1.json
  def update
    respond_to do |format|
      if @admin_festival.update(admin_festival_params)
        format.html { redirect_to @admin_festival, notice: "Festival was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @admin_festival }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_festival.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/festivals/1 or /admin/festivals/1.json
  def destroy
    @admin_festival.destroy!

    respond_to do |format|
      format.html { redirect_to admin_festivals_path, notice: "Festival was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_festival
      @admin_festival = Admin::Festival.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def admin_festival_params
      params.expect(admin_festival: [ :name, :is_active ])
    end
end
