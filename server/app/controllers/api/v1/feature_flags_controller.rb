class Api::V1::FeatureFlagsController < ApplicationControllerApi
  def index
    @feature_flags = FeatureFlag.all
    render json: @feature_flags
  end

  def show
    @feature_flag = FeatureFlag.find(params[:id])
    render json: @feature_flag

  rescue ActiveRecord::RecordNotFound
    render json: { error: "Feature flag not found" }, status: :not_found
  end

  def create
    @feature_flag = FeatureFlag.new(feature_flag_params)
    if @feature_flag.save
      render json: @feature_flag, status: :created
    else
      render json: @feature_flag.errors, status: :unprocessable_content
    end
  end

  def update
    @feature_flag = FeatureFlag.find(params[:id])
    if @feature_flag.update(feature_flag_params)
      render json: @feature_flag
    else
      render json: @feature_flag.errors, status: :unprocessable_content
    end
  end

  def destroy
    @feature_flag = FeatureFlag.find(params[:id])
    @feature_flag.destroy
    head :no_content

  rescue ActiveRecord::RecordNotFound
    render json: { error: "Feature flag not found" }, status: :not_found
  end

  private

  def feature_flag_params
    params.require(:feature_flag).permit(:name, :value)
  end
end
