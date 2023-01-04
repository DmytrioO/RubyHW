ActiveAdmin.register Order do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :cart_id, :user_id, :order_status, :payment_status
  permit_params :order_status, :payment_status
  # or
  #
  # permit_params do
  #   permitted = [:cart_id, :user_id, :order_status, :payment_status]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  # show do
  #   order.cart.cart_products.each do |product|
  #     h3 product.name
  #   end
  # end
  show do
    attributes_table do
      row :Order_Status do
        order.order_status.capitalize
      end
      row :Payment_Status do
        order.payment_status.capitalize
      end
      row :Order do
        '->'
      end
      total = 0
      order.cart.cart_products.each do |product|
        if product.id != order.cart.cart_products.first.id
          row :divider do
            '___'
          end
        end
        row :name do
          product.name
        end
        row :price do
          "#{product.price}$"
        end
        row :quantity do
          product.quantity
        end
        row :sum do
          "#{product.quantity * product.price}$"
        end
        total += product.quantity * product.price
      end
      row :Order do
        '<-'
      end
      row :Total do
        "#{total}$"
      end
      row :Info do
        '->'
      end
      order_info = OrderInformation.where(:order_id == order.id).last
      row :Client_Fullname do
        order_info.full_name
      end
      row :Phone_Number do
        order_info.phone
      end
      row :Email do
        order.user.email
      end
      row :Delivering_City do
        order_info.city
      end
      row :Delivering_Street do
        order_info.street
      end
      row :Delivering_House do
        order_info.house
      end
      row :Delivering_Apartaments do
        order_info.apartaments
      end
      row :Info do
        '<-'
      end
    end
    active_admin_comments
  end
  
end
