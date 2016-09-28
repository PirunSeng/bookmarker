class FindersController < ApplicationController
  before_action :find_finder, only: [:show, :edit, :update, :destroy]

  def index
    @finder_grid = FinderGrid.new(params[:finder_grid])
    respond_to do |f|
      f.html do
        @finder_grid.scope { |scope| scope.paginate(page: params[:page], per_page: 20) }
      end
      f.csv do
        send_data @finder_grid.to_csv, type: 'text/csv',
                                       disposition: 'inline',
                                       filename: "finder_references-#{Time.now}.csv"
      end
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
