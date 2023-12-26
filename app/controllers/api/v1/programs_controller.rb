class Api::V1::ProgramsController < ApplicationController
  def index
    @programs = Program.all.order(created_at: :desc)
    options = {
      include: %i[teams church]
    }
    render json: ProgramSerializer.new(@programs, options)
  end

  def show
    @program = Program.find(params[:id])
    options = {
      include: %i[teams church]
    }
    render json: ProgramSerializer.new(@programs, options)
  end

  def create
    @program = Program.new(program_params.except(:teams))
    add_programs_teams(@program, params[:program][:teams]) unless params[:member][:teams].empty?

    if @program.save
      options = {
        include: %i[teams church]
      }
      render json: { program: ProgramSerializer.new(@programs, options), message: 'success' }, status: :created
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

  def add_programs_teams(program, teams)
    program.teams.destroy_all
    teams.split(',').each do |team_id|
      team = Team.find(team_id)
      program.teams << team
    end
  end

  def program_params
    params.require(:program).permit(:teams, :church_id, :name, :date)
  end
end
