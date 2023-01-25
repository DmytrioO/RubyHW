ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  permit_params :name, :description, :image, :price, :category_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :image, :price, :category]
  #   #permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    column :id
    column :name
    column :price
    column :category
    column :created_at
    column :updated_at
    actions
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
  
end
