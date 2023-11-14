class Api::V1::ProgramsController < ApplicationController
  def index
    @programs = Program.all.order(created_at: :desc)
    render json: @programs
  end

  def show
    @program = Program.find(params[:id])
    render json: @program
  end

  def create
    @program = Program.new(program_params)

    if @program.save
      render json: { program: @program, message: 'success' }, status: :created
    else
      render json: { error: 'Error creating program' }, status: :unprocessable_entity
    end
  end

  def update
    @program = Program.find(params[:id])

    if @program.update(program_params)
      render json: @program
    else
      render json: { error: 'Error updating program data' }, status: :unprocessable_entity
    end
  end

  def destroy
    @program = Program.find(params[:id])
    @program.destroy
    head :no_content
  end

  private

  def program_params
    params.require(:program).permit(:church_id, :name, :date, :team_id)
  end
end
