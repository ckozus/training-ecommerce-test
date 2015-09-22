module WelcomeHelper

  def cart_total
    total = 0
    @products_in_cart.each do |product|
      total += product.price
    end
    total
  end

end
