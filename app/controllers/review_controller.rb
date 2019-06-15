class ReviewController < ApplicationController
	before_filter :create

	def create
		@review = Review.new(review_params)
		@review.product_id = params[:product_id]
		@review.user_id = current_user.id

  	if @review.save
  		redirect_to '/'
  	else
  		p @review.errors
  		redirect_to :back
  	end	

  	# private
	end

	def review_params
      params.require(:review).permit(:description, :rating)
  end

end