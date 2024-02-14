class Event < ApplicationRecord
  belongs_to :user, class_name: "User"
  validates :name, presence: true, on: :create
end
