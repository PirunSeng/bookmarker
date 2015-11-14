class FindersController < ApplicationController
  before_action :set_finder, only: [:show, :edit, :update, :destroy]

  # GET /finders
  # GET /finders.json
  def index
    @finders = Finder.all
  end

  # GET /finders/1
  # GET /finders/1.json
  def show
  end

  # GET /finders/new
  def new
    @finder = Finder.new
  end

  # GET /finders/1/edit
  def edit
  end

  # POST /finders
  # POST /finders.json
  def create
    @finder = Finder.new(finder_params)

    respond_to do |format|
      if @finder.save
        format.html { redirect_to @finder, notice: 'Finder was successfully created.' }
        format.json { render :show, status: :created, location: @finder }
      else
        format.html { render :new }
        format.json { render json: @finder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /finders/1
  # PATCH/PUT /finders/1.json
  def update
    respond_to do |format|
      if @finder.update(finder_params)
        format.html { redirect_to @finder, notice: 'Finder was successfully updated.' }
        format.json { render :show, status: :ok, location: @finder }
      else
        format.html { render :edit }
        format.json { render json: @finder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /finders/1
  # DELETE /finders/1.json
  def destroy
    @finder.destroy
    respond_to do |format|
      format.html { redirect_to finders_url, notice: 'Finder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_finder
      @finder = Finder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def finder_params
      params.require(:finder).permit(:name, :reference)
    end
end
