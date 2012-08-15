class ScreencastsController < ApplicationController
  # GET /screencasts
  # GET /screencasts.json
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
