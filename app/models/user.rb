class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :confirmable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }, allow_nil: true

  has_many :foods, dependent: :destroy
  has_many :recipes, dependent: :destroy

  private

  def password_required?
    !persisted? || password.present? || password_confirmation.present?
  end
end
