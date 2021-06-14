ActiveAdmin.register User do
        permit_params :email, :password, :password_confirmation,  :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at

        filter :email
        filter :id
        show do
                attributes_table do
                        row :email
                        row :created_at
                        row :updated_at
                end     
        end

        form do |f|
                f.semantic_errors *f.object.errors.keys
                inputs do
                        input:email
                        input:password
                        input:password_confirmation
                end
                actions
        end
end
