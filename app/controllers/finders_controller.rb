class FindersController < ApplicationController
  before_action :find_finder, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search]
      @finders = Finder.search(params[:search]).order(:name).paginate(page: params[:page], per_page: 20)
    else
      @finders = Finder.all.order(:name).paginate(page: params[:page], per_page: 20)
    end
  end

  def show
  end

  def new
    @finder = Finder.new
  end

  def edit
  end

  def create
    @finder = Finder.create(finder_params)
    @finder.user_id = current_user.id
    if @finder.save
      redirect_to @finder, notice: 'Finder was successfully created.'
    else
      render :new
    end
  end

  def update
    if @finder.update_attributes(finder_params)
      redirect_to @finder, notice: 'Finder was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @finder.destroy
    redirect_to finders_url, notice: 'Finder was successfully deleted.'
  end

  private

  def find_finder
    @finder = Finder.find(params[:id])
  end

  def finder_params
    params.require(:finder).permit(:name, :reference, :description)
  end
end
