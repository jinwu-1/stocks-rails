class User < ApplicationRecord
    validates :username, uniqueness: true
    validates :username, length: { minimum: 4 }
    validates :password, length: { minimum: 4 }

    has_secure_password
end
