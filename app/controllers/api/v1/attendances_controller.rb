class Api::V1::AttendancesController < ApplicationController
  before_action :authenticate_user!

  def index
    @attendances = Attendance.all.order(created_at: :desc)
    options = {
      include: %i[program]
    }
    render json: { attendance: AttendanceSerializer.new(@attendances, options), message: 'success' }
  end

  def show
    @attendance = Attendance.find(params[:id])
    options = {
      include: %i[program]
    }
    render json: AttendanceSerializer.new(@attendance, options)
  end

  def create
    existing_attendance = Attendance.find_by(attendance_params) # Find existing record based on given params

    # Destroy if found
    existing_attendance&.destroy
    @attendance = Attendance.new(attendance_params)

    if @attendance.save
      options = {
        include: %i[program]
      }
      render json: { attendance: AttendanceSerializer.new(@attendance, options), message: 'success' }, status: :created
    else
      render json: { error: 'Error creating attendance' }, status: :unprocessable_entity
    end
  end

  def update
    @attendance = Attendance.find(params[:id])

    if @attendance.update(attendance_params)
      options = {
        include: %i[program]
      }
      render json: { attendance: AttendanceSerializer.new(@attendance, options), message: 'success' }, status: :ok
    else
      render json: { error: 'Error updating attendance data' }, status: :unprocessable_entity
    end
  end

  def destroy
    @attendance = Attendance.find(params[:id])
    if @attendance.destroy
      @attendances = Attendance.all.order(created_at: :desc)
      options = {
        include: %i[program]
      }
      render json: AttendanceSerializer.new(@attendances, options)
    else
      render json: { error: 'Error Deleting member data' }, status: :unprocessable_entity
    end
  end

  private

  def attendance_params
    params.require(:attendance).permit(:program_id, :member_name, :status, :remark)
  end
end
