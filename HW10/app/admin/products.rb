ActiveAdmin.register Product do
  index do
    column :id
    column :name
    column :price do |product|
      number_to_currency(product.price, unit: '$', separator: ',', delimiter: ' ')
    end
    column :category
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :price do
        number_to_currency(product.price, unit: '$', separator: ',', delimiter: ' ')
      end
      row :category
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :image, as: :file
      f.input :price
      f.input :category
    end
    actions
  end

  permit_params :name, :description, :image, :price, :category_id
end
