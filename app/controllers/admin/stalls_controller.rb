class Admin::StallsController < ApplicationController
  before_action :set_stall, only: %i[ show edit update destroy ]

  # GET /admin/stalls or /admin/stalls.json
  def index
    @stalls = Stall.all
  end

  # GET /admin/stalls/1 or /admin/stalls/1.json
  def show
  end

  # GET /admin/stalls/new
  def new
    @stall = Stall.new
  end

  # GET /admin/stalls/1/edit
  def edit
  end

  # POST /admin/stalls or /admin/stalls.json
  def create
    @stall = Stall.new(stall_params)

    respond_to do |format|
      if @stall.save
        format.html { redirect_to [ :admin, @stall ], notice: "Stall was successfully created." }
        format.json { render :show, status: :created, location: @stall }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stall.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/stalls/1 or /admin/stalls/1.json
  def update
    respond_to do |format|
      if @stall.update(stall_params)
        format.html { redirect_to [ :admin, @stall ], notice: "Stall was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @stall }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stall.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/stalls/1 or /admin/stalls/1.json
  def destroy
    @stall.destroy!

    respond_to do |format|
      format.html { redirect_to admin_stalls_path, notice: "Stall was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stall
      @stall = Stall.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def stall_params
      params.expect(stall: [ :name, :description, :festival_id, :user_id, :status_text, :auth_code ])
    end
end
