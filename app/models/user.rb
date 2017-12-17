class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true


  scope :join_with_token, -> (id) {
    select('users.*, o.token')
      .joins('as users join oauth_access_grants o on o.resource_owner_id = users.id')
      .where('users.id = ?', id)
      .first
  }
end
