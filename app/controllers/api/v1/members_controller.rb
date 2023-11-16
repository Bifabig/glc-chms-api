class Api::V1::MembersController < ApplicationController
  def index
    @members = Member.all
    options = {
      include: [:teams]
    }
    render json: MemberSerializer.new(@members, options)
  end

  def show
    @member = Member.find(params[:id])
    render json: @member
  end

  def create
    @member = Member.new(member_params)

    if @member.save
      render json: { member: @member, message: 'success' }, status: :created
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

  def member_params
    params.require(:member).permit(:church_id, :name, :photo, :address, :phone_number, :joined_at)
  end
end
