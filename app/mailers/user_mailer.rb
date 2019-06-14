class UserMailer < ApplicationMailer
	default from: 'no-reply@jungle.com'
 
  def welcome_email(order)
    @order = order
    @url  = 'http://localhost:3000/login'

   #  def enhanced_cart
   #  	@enhanced_cart ||= Product.where(id: cart.keys).map {|product| { product:product, quantity: cart[product.id.to_s] } }
	  # end
	  # helper_method :enhanced_cart

	  # def cart_subtotal_cents
	  #   enhanced_cart.map {|entry| entry[:product].price_cents * entry[:quantity]}.sum
	  # end
	  # helper_method :cart_subtotal_cents

    mail(to: order.email, subject: 'Thank you for the order! #{@order.id}')
  end

end
