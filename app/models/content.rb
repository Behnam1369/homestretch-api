class Content < ApplicationRecord
  belongs_to :user
  has_many :pages, dependent: :destroy
  accepts_nested_attributes_for :pages, allow_destroy: true
end
