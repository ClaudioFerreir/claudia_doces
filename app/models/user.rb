class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_one :user_profile, dependent: :destroy
  accepts_nested_attributes_for :user_profile, reject_if: :all_blank

  # Validations
  validates :first_name, presence: true, length: { minimum: 2 }, on: :update

  # Virtual Attributes
  def full_name
    [self.first_name, self.last_name].join(' ')
  end
end
