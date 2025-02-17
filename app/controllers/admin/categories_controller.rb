class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: "Jungle", password: "book"

	def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Product created!'
    else
      render :new
    end
  end

  # def destroy
  #   @category = Category.find params[:id]
  #   @product.destroy
  #   redirect_to [:admin, :categories], notice: 'Product deleted!'
  # end

  private

  def category_params
    params.require(:category).permit(
      :name,
      :id
    )
  end
end
