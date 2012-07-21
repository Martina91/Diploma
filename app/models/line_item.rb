class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  belongs_to :order

  def total_price
    product.price * quantity
  end




#  <tr>
     # <td><%= line_item.quantity %> &times;</td>
     # <td><%= line_item.product.title %></td>
     # <td class="item_price"><%= number_to_currency(line_item.total_price)%></td>
  # </tr>

end
