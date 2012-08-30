class TagsController < ApplicationController
  # GET /tags
  # GET /tags.json
  before_filter :require_admin, :only => [:new, :edit, :show, :index]
  
  def require_admin
    if !session[:user_id] || User.find(session[:user_id]).admin == false
      redirect_to root_url
    end
  end
  
  def index
    @tags = Screencast.find(params[:id]).tags
    @tag = Tag.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tags }
    end
  end

  # GET /tags/1
  # GET /tags/1.json
  def show
    @tag = Tag.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tag }
    end
  end

  # GET /tags/new
  # GET /tags/new.json
  def new
    @tag = Tag.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tag }
    end
  end

  # GET /tags/1/edit
  def edit
    @tag = Tag.find(params[:id])
  end

  # POST /tags
  # POST /tags.json
  def create
    # @tag = Tag.new
    tag_string = params[:tag][:keyword]
    tag_list = tag_string.gsub(" ","").split(",")
    tag_list.each do |tag|
      t = Tag.new
      t.keyword = tag 
      t.screencast_id = params[:tag][:screencast_id]
      t.save
    end
    redirect_to screencast_url(params[:tag][:screencast_id])
    # respond_to do |format|
    #       if @tag.save
    #         format.html { redirect_to @tag, notice: 'Tag was successfully created.' }
    #         format.json { render json: @tag, status: :created, location: @tag }
    #       else
    #         format.html { render action: "new" }
    #         format.json { render json: @tag.errors, status: :unprocessable_entity }
    #       end
    #     end
  end

  # PUT /tags/1
  # PUT /tags/1.json
  def update
    @tag = Tag.find(params[:id])

    respond_to do |format|
      if @tag.update_attributes(params[:tag])
        format.html { redirect_to @tag, notice: 'Tag was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def casts_for_tag
    @tags = Tag.where("LOWER(keyword) = ?", params[:keyword].downcase)
  end

  # DELETE /tags/1
  # DELETE /tags/1.json
  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    respond_to do |format|
      format.html { redirect_to tags_url(:id => params[:screencast_id]) }
      format.json { head :no_content }
    end
  end
end
