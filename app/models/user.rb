class User < ApplicationRecord
  has_secure_password

  enum role: { member: 0, data_expert: 1, admin: 2 }

  def new_attr
    {
      id: self.id,
      name: self.name,
      email: self.email,
      phone_number: self.phone_number
    }
  end
end
