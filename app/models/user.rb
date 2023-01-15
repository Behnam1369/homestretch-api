class User < ApplicationRecord
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         :confirmable,
         jwt_revocation_strategy: JwtDenylist
end
