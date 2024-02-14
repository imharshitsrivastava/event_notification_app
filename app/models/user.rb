class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, class_name: "Event"
  # validates spaces at the begining and end
  validates_format_of :password, :with => /\A[^\s]+(\s+[^\s]+)?$\Z/, message: "spaces not allowed", on: :create
  validates_format_of :password, :with => /\A^(?=.*?[A-Z])(?=(.*[a-z]){1,})(?=(.*[\d]){1,})(?=(.*[\W]){1,})(?!.*\s).{8,}$\Z/, message: "contains both upper and lower case character, at least one numeric character and at least one special character (need minimum is 8 characters)", on: :create
  validates :first_name, :last_name, presence: true, on: :create
  # validates alphabets only
  validates :email, format: { with: /\A^[^\W_](?:[\w.-]*[^\W_])?@(?:\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.|(?:[\w-]+\.)+)(?:[a-zA-Z]{2,3}|[0-9]{1,3})\]?$\Z/, message: "is invalid" }
  validates_confirmation_of :password, if: -> { password_confirmation.present? }

end
