class Api::V1::MembersController < ApplicationController
  def index
    @members = Member.all.order(created_at: :desc)
    options = {
      include: %i[teams church]
    }
    # serialized json api
    render json: MemberSerializer.new(@members, options)
  end

  def show
    @member = Member.find(params[:id])
    render json: @member
  end

  def create
    @member = Member.new(member_params.except(:team_id))

    add_members_teams(@member, params[:member][:team_id])

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

    if @member.update(member_params)
      render json: @member
    else
      render json: { error: 'Error updating member data' }, status: :unprocessable_entity
    end
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    head :no_content
  end

  private

  def add_members_teams(member, team_id)
    member.teams << Team.find(team_id)
  end

  def member_params
    params.require(:member).permit(:team_id, :church_id, :name, :photo, :address, :phone_number, :joined_at)
  end
end
