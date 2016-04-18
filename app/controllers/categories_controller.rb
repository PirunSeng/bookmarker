class CategoriesController < ApplicationController
  before_action :only_admin
  before_action :find_category, only: [:edit, :update, :destroy]

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id
    if @category.save
      redirect_to root_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def update
    if @category.update(category_params)
      redirect_to root_path, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categorys_url, notice: 'Category was successfully destroyed.'
  end

  private

    def only_admin
      if current_user.role != 'admin'
        redirect_to root_path, notce: "You're not authorized to perform this action."
      end
    end

    def find_category
      @category = Category.find(params[:id])
    end


    def category_params
      params.require(:category).permit(:name)
    end

end
