class User < ApplicationRecord
  validates :name,
            presence: true,
            length: { maximum: 100 }
  validates :email,
            presence: true,
            length: { maximum: 255 },
            :uniqueness => true
  validates :password,
            length: { minimum: 6 },
            presence: true

  validates_format_of :email,
                      :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
                      :on => :create

  before_save { self.email = email.downcase }

  has_secure_password
end
