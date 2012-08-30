class MembershipsController < ApplicationController
  
  def new
    @membership = Membership.new
  end
  
  def create
    @membership = Membership.new(params[:membership])

    respond_to do |format|
      if @membership.save
        format.html { redirect_to members_url(@membership.company_id), notice: 'Member was successfully added.' }
        format.json { render json: @note, status: :created, location: @note }
      else
        format.html { render action: "new" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
end
