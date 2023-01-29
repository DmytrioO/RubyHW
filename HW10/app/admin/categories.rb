ActiveAdmin.register Category do
  index do
    selectable_column
    id_column
    column :title
    column :created_at
    actions
  end

  permit_params :title
end
