class Api::V1::ChurchesController < ApplicationController
  def index
    @churches = Church.all.order(created_at: :desc)
    render json: @churches
  end

  def show
    @church = Church.find(params[:id])
    render json: @church
  end

  def create
    @church = Church.new(church_params)

    if @church.save
      render json: { church: @church, message: 'success' }, status: :created
    else
      render json: { error: 'Error creating church' }, status: :unprocessable_entity
    end
  end

  def update
    @church = Church.find(params[:id])

    if @church.update(church_params)
      render json: @church
    else
      render json: { error: 'Error updating church data' }, status: :unprocessable_entity
    end
  end

  def destroy
    @church = Church.find(params[:id])
    @church.destroy
    head :no_content
  end

  private

  def church_params
    params.require(:church).permit(:user_id, :name, :established_at, :location)
  end
end
