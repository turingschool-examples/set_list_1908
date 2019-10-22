class User <ApplicationRecord
  validates :username, uniqueness: true, presence: true
  validates_presence_of :password, require: true

  has_secure_password

  enum role: %w(default admin)

  # enum role: {default: 0, admin: 2, merchant: 1}

end
