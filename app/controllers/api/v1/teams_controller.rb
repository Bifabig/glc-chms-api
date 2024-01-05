class Api::V1::TeamsController < ApplicationController
  def index
    @teams = Team.all
    # options = {
    #   include: [:members]
    # }
    # render json: TeamSerializer.new(@teams, options)
    render json: @teams
  end

  def show
    @team = Team.find(params[:id])
    render json: @team
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      render json: { team: @team, message: 'success' }, status: :created
    else
      render json: { error: 'Error creating team' }, status: :unprocessable_entity
    end
  end

  def update
    @team = Team.find(params[:id])

    if @team.update(team_params)
      render json: @team
    else
      render json: { error: 'Error updating team data' }, status: :unprocessable_entity
    end
  end

  def destroy
    @team = Team.find(params[:id])
    if @team.destroy
      @teams = Team.all.order(created_at: :desc)
      render json: @teams
    else
      render json: { error: 'Error Deleting team data' }, status: :unprocessable_entity
    end
  end

  private

  def team_params
    params.require(:team).permit(:church_id, :name, :main_leader_name, :sub_leader_name, :established_at)
  end
end
