class ReviewController < ApplicationController
	before_filter :create, :destroy

	def create
		@review = Review.new(review_params)
		@review.user_id = current_user
		@review.product_id = params[:product_id]

  	if @review.save
  		redirect_to "/products/#{params[:product_id]}"
  	else
  		p @review.errors
  		redirect_to :back
  	end	

	end
	def review_params
      params.require(:review).permit(:description, :rating)
  end

	def destroy
		@review = Review.find params[:id]
    @review.destroy
    redirect_to "/products/#{params[:product_id]}"
	end

end