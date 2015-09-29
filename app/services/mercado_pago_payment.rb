class MercadoPagoPayment
  include Rails.application.routes.url_helpers

  def build(order, products)
    client_id = ENV['MP_CLIENT_ID']
    client_secret = ENV['MP_SECRET']
    mp_client = MercadoPago::Client.new(client_id, client_secret)

    items = []
    products.each do |product|
      items << {
          id:           product.id,
          title:        product.name,
          description:  product.description,
          quantity:     1,
          unit_price:   product.price.to_f,
          currency_id:  "ARS",
          picture_url:  product.image.url(:medium)
        }
    end

    data = {
      external_reference: order.id,
      items: items,
      payer: {
        name:     order.name,
        surname:  order.surname,
        email:    order.email
      },
      back_urls: {
        pending: pending_url,
        success: success_url,
        failure: failure_url
      }
    }
    mp_client.sandbox_mode(true)
    mp_client.create_preference(data)
  end


end
