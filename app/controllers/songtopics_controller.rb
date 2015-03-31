class SongtopicsController < ApplicationController
  before_action :set_songtopic, only: [:show, :edit, :update, :destroy]

  # GET /songtopics
  # GET /songtopics.json
  def index
    @songtopics = Songtopic.all
  end

  # GET /songtopics/1
  # GET /songtopics/1.json
  def show
  end

  # GET /songtopics/new
  def new
    @songtopic = Songtopic.new
  end

  # GET /songtopics/1/edit
  def edit
  end

  # POST /songtopics
  # POST /songtopics.json
  def create
    @songtopic = Songtopic.new(songtopic_params)

    respond_to do |format|
      if @songtopic.save
        format.html { redirect_to @songtopic, notice: 'Songtopic was successfully created.' }
        format.json { render :show, status: :created, location: @songtopic }
      else
        format.html { render :new }
        format.json { render json: @songtopic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /songtopics/1
  # PATCH/PUT /songtopics/1.json
  def update
    respond_to do |format|
      if @songtopic.update(songtopic_params)
        format.html { redirect_to @songtopic, notice: 'Songtopic was successfully updated.' }
        format.json { render :show, status: :ok, location: @songtopic }
      else
        format.html { render :edit }
        format.json { render json: @songtopic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songtopics/1
  # DELETE /songtopics/1.json
  def destroy
    @songtopic.destroy
    respond_to do |format|
      format.html { redirect_to songtopics_url, notice: 'Songtopic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @topic = Songtopic.find(params[:id])
    @topic.votes.create
    redirect_to(songtopics_path)
  end

  def downvote
    @topic = Songtopic.find(params[:id])
    # if(@topic.votes > 0)
    @topic.votes.first.destroy
    # end
    redirect_to(songtopics_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_songtopic
      @songtopic = Songtopic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def songtopic_params
      params.require(:songtopic).permit(:name, :album)
    end
  end
