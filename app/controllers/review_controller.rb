class ReviewController < ApplicationController
	
	def create
		@review = Review.new
		@review.user_id = current_user.id
		@review.product_id = params[:product_id]
		# @review.errors.messages

  	if @review.save!
  		review.save
  		redirect_to '/'
  	else
  		redirect_to :back
  	end	

  	# private

    def review_params
      params.require(:review).permit(:description, :rating)
    end
	end

end