class Api::V1::AttendancesController < ApplicationController
  def index
    @attendances = Attendance.all.order(created_at: :desc)
    options = {
      include: %i[program]
    }
    render json: { attendance: AttendanceSerializer.new(@attendances, options), message: 'success' }
  end

  def show
    @attendance = Attendance.find(params[:id])
    render json: @attendance
  end

  def create
    existing_attendance = Attendance.find_by(attendance_params) # Find existing record based on given params

    if existing_attendance
      existing_attendance.destroy # Destroy if found
    end
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
    params.require(:attendance).permit(:program_id, :member_name, :status, :remark)
  end
end
