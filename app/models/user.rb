class User < ApplicationRecord
        has_many :articles, dependent: :destroy
  
        devise :database_authenticatable, :registerable,
                :recoverable, :rememberable, :validatable
                
        def username
                email.split('@')[0].capitalize
        end

        # Include default devise modules. Others available are:
        # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
end
