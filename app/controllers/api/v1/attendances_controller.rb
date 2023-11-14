class Api::V1::AttendancesController < ApplicationController
  def index
    @attendances = Attendance.all.order(created_at: :desc)
    render json: @attendances
  end

  def show
    @attendance = Attendance.find(params[:id])
    render json: @attendance
  end

  def create
    @attendance = Attendance.new(attendance_params)

    if @attendance.save
      render json: { attendance: @attendance, message: 'success' }, status: :created
    else
      render json: { error: 'Error creating attendance' }, status: :unprocessable_entity
    end
  end

  def update
    @attendance = Attendance.find(params[:id])

    if @attendance.update(attendance_params)
      render json: @attendance
    else
      render json: { error: 'Error updating attendance data' }, status: :unprocessable_entity
    end
  end

  def destroy
    @attendance = Attendance.find(params[:id])
    @attendance.destroy
    head :no_content
  end

  private

  def attendance_params
    params.require(:attendance).permit(:program_id, :att_taker)
  end
end
