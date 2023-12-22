class Api::V1::MembersController < ApplicationController
  def index
    @members = Member.all.order(created_at: :desc)
    options = {
      include: %i[teams church]
    }
    render json: MemberSerializer.new(@members, options)
  end

  def show
    @member = Member.find(params[:id])
    options = {
      include: %i[teams church]
    }
    render json: MemberSerializer.new(@member, options)
  end

  def create
    @member = Member.new(member_params.except(:teams))
    add_members_teams(@member, params[:member][:teams]) unless params[:member][:teams].empty?

    if @member.save
      options = {
        include: %i[teams church]
      }
      render json: { member: MemberSerializer.new(@member, options), message: 'success' }, status: :created
    else
      render json: { error: 'Error creating member' }, status: :unprocessable_entity
    end
  end

  def update
    @member = Member.find(params[:id])
    add_members_teams(@member, params[:member][:teams])

    if @member.update(member_params.except(:teams))
      options = {
        include: %i[teams church]
      }
      render json: { member: MemberSerializer.new(@member, options), message: 'success' }, status: :created
    else
      render json: { error: 'Error updating member data' }, status: :unprocessable_entity
    end
  end

  def destroy
    @member = Member.find(params[:id])

    if @member.destroy
      @members = Member.all.order(created_at: :desc)
      options = {
        include: %i[teams church]
      }
      render json: MemberSerializer.new(@members, options)
    else
      render json: { error: 'Error Deleting member data' }, status: :unprocessable_entity
    end
  end

  private

  def add_members_teams(member, teams)
    member.teams.destroy_all
    teams.split(',').each do |team_id|
      team = Team.find(team_id)
      member.teams << team
    end
  end

  def member_params
    params.require(:member).permit(:teams, :church_id, :name, :photo, :address, :phone_number, :joined_at)
  end
end
