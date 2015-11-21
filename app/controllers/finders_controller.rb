class FindersController < ApplicationController
  before_action :set_finder, only: [:show, :edit, :update, :destroy]
  before_action :set_category

  def rubyonrails
    @finders = Finder.rubyonrails
  end

  def jquery
    @finders = Finder.jquery
  end

  def index
    @finders = Finder.all.order(:name)
  end

  def show
  end

  def new
    @finder = Finder.new
  end

  def edit
  end

  def create
    @finder = Finder.new(finder_params)
    @finder.user_id = current_user.id

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

  def destroy
    @finder.destroy
    respond_to do |format|
      format.html { redirect_to finders_url, notice: 'Finder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_finder
      @finder = Finder.find(params[:id])
    end


    def finder_params
      params.require(:finder).permit(:name, :reference, :category_id)
    end

    def set_category
      @categories = Category.all
    end
end
