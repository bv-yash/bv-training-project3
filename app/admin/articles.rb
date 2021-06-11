ActiveAdmin.register Article do
        permit_params :title, :body, :user_id

        filter :id
        filter :title
        # filter :user, as: :string

        form do |f|
                f.semantic_errors *f.object.errors.keys
                f.inputs do
                        input:user_id
                        input:title
                        input:body
                end
                actions
        end

end
