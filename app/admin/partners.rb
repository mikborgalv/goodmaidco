ActiveAdmin.register Partner do
  permit_params :name, :phone_number, :rating, :role, :user_id

  form do |f|
    f.inputs do
      f.input :name
      f.input :phone_number
      f.input :rating
      f.input :role, as: :select, collection: Partner::ROLES
      f.input :user_id, as: :select, collection: User.all.map { |u| [u.email, u.id] }
    end
    f.actions
  end
end