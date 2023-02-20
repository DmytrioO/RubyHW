ActiveAdmin.register Order do
  actions :all, except: :new

  filter :order_status, as: :select, collection: proc { Order.order_statuses }
  filter :payment_status, as: :select, collection: proc { Order.payment_statuses }
  filter :created_at
  filter :updated_at

  index do
    column :id
    column :user do |order|
      order.user.presence || 'DeletedUser'
    end
    column :order_status
    column :payment_status
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      order_info = order.order_information

      row :order_status do
        order.order_status.capitalize
      end

      row :payment_status do
        order.payment_status.capitalize
      end

      order.cart.cart_products.each do |product|
        row :name do
          product.name
        end

        row :price do
          number_to_currency(product.price, unit: '$', separator: ',', delimiter: ' ')
        end

        row :quantity do
          product.quantity
        end

        row :sum do
          number_to_currency(product.sum, unit: '$', separator: ',', delimiter: ' ')
        end
      end

      row :total do
        number_to_currency(order_info.total, unit: '$', separator: ',', delimiter: ' ')
      end

      row :client_fullname do
        "#{order_info.first_name} #{order_info.last_name}"
      end

      row :phone_number do
        order_info.phone
      end

      row :email do
        order.user.nil? ? 'Deleted' : order.user.email
      end

      row :delivering_city do
        order_info.city
      end

      row :delivering_street do
        order_info.street
      end

      row :delivering_house do
        order_info.house
      end

      row :delivering_apartments do
        order_info.apartments
      end
    end
    active_admin_comments
  end

  form title: 'Order' do |_|
    inputs :order_status, :payment_status
    actions
  end

  permit_params :order_status, :payment_status
end
