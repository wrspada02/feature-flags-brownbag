class FeatureFlagsController < ApplicationController
  before_action :set_feature_flag, only: %i[ show edit update destroy ]

  # GET /feature_flags or /feature_flags.json
  def index
    @feature_flags = FeatureFlag.all
  end

  # GET /feature_flags/1 or /feature_flags/1.json
  def show
  end

  # GET /feature_flags/new
  def new
    @feature_flag = FeatureFlag.new
  end

  # GET /feature_flags/1/edit
  def edit
  end

  # POST /feature_flags or /feature_flags.json
  def create
    @feature_flag = FeatureFlag.new(feature_flag_params)

    respond_to do |format|
      if @feature_flag.save
        format.html { redirect_to @feature_flag, notice: "Feature flag was successfully created." }
        format.json { render :show, status: :created, location: @feature_flag }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @feature_flag.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /feature_flags/1 or /feature_flags/1.json
  def update
    respond_to do |format|
      if @feature_flag.update(feature_flag_params)
        format.html { redirect_to @feature_flag, notice: "Feature flag was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @feature_flag }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @feature_flag.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /feature_flags/1 or /feature_flags/1.json
  def destroy
    @feature_flag.destroy!

    respond_to do |format|
      format.html { redirect_to feature_flags_path, notice: "Feature flag was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feature_flag
      @feature_flag = FeatureFlag.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def feature_flag_params
      params.require(:feature_flag).permit(:name, :value)
    end
end
