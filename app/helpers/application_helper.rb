
module ApplicationHelper
  def get_icons()
    Dir.glob("app/assets/images/user_icons/*.svg")
  end

  def createPayButton()
    # Use your credentials
    client_id = '1786301777205622'
    client_secret = '70YhgEZZ9b9XfA3hToxOHXzfAnXXawaw'

    client = Mercadopago::Sdk.new(client_id, client_secret)
    
    data = {
              :items => [
                  { 
                      :title => "Donate",
                      :currency_id => "ARS", 
                      :unit_price => 10.50,
                      :quantity => 1,
                  }
              ]
          }
    preference = client.create_checkout_preference(data)
    return preference['sandbox_init_point']

  end
end
