ActiveAdmin.register Chunk do
  permit_params :public_ip, :private_ip, :content

  filter :user, as: :select, collection: proc { User.all.map { |user| [user.email, user.id] } }
  filter :content
  filter :created_at

  form html: { multipart: true } do |f|
    f.inputs 'Chunk Details' do
      f.input :public_ip
      f.input :private_ip
      f.input :content
    end
    f.actions
  end

  index do
    column :id
    column :user do |chunk|
      chunk.user.email
    end
    column :public_ip
    column :private_ip
    column :created_at
    column :updated_at
    actions
  end

  show do |chunk|
    attributes_table do
      row :id
      row :user do
        chunk.user.email
      end
      row :public_ip
      row :private_ip
      row :content do
        simple_format(chunk.content)
      end
      row :created_at
      row :updated_at
    end
  end
end
