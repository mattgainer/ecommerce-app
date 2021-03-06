class User < ActiveRecord::Base
  has_many :products
  has_many :orders
  belongs_to :role
  def admin?
    if role.name == "admin"
      return true
    else
      return false
    end
  end
  def buyer?
    if role.name == "buyer"
      return true
    else
      return false
    end
  end
  def supplier?
    if role.name == "supplier"
      return true
    else
      return false
    end
  end
  def full_name
    "#{first_name} #{last_name}"
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
