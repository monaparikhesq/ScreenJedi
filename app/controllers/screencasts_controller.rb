class ScreencastsController < ApplicationController
  # GET /screencasts
  # GET /screencasts.json
  before_filter :require_login_admin, :only => [:new]
  before_filter :require_login_admin_co, :only => [:edit, :destroy]
  
  def require_login_admin
    if !session[:user_id].present? || 
      User.find(session[:user_id]).admin == false
      redirect_to root_url, notice: 'Fuck you!'
    end
  end
  
  def require_login_admin_co
    if !session[:user_id].present? || 
      User.find(session[:user_id]).admin == false ||
      User.find(session[:user_id]).company.id != Screencast.find(params[:id]).company.id
      redirect_to root_url, notice: 'Fuck you!'
    end
  end
  
  def index
    @screencasts = Screencast.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @screencasts }
    end
  end

  # GET /screencasts/1
  # GET /screencasts/1.json
  def show
    @screencast = Screencast.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @screencast }
    end
  end

  # GET /screencasts/new
  # GET /screencasts/new.json
  def new
    @screencast = Screencast.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @screencast }
    end
  end

  # GET /screencasts/1/edit
  def edit
    @screencast = Screencast.find(params[:id])
  end

  # POST /screencasts
  # POST /screencasts.json
  def create
    @screencast = Screencast.new(params[:screencast])
    @screencast.company_id = User.find(session[:user_id]).company.id

    respond_to do |format|
      if @screencast.save
        format.html { redirect_to @screencast, notice: 'Screencast was successfully created.' }
        format.json { render json: @screencast, status: :created, location: @screencast }
      else
        format.html { render action: "new" }
        format.json { render json: @screencast.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /screencasts/1
  # PUT /screencasts/1.json
  def update
    @screencast = Screencast.find(params[:id])

    respond_to do |format|
      if @screencast.update_attributes(params[:screencast])
        format.html { redirect_to @screencast, notice: 'Screencast was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @screencast.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /screencasts/1
  # DELETE /screencasts/1.json
  def destroy
    @screencast = Screencast.find(params[:id])
    @screencast.destroy

    respond_to do |format|
      format.html { redirect_to screencasts_url }
      format.json { head :no_content }
    end
  end
end
