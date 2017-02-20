class Contact < ApplicationRecord
  belongs_to :company, optional: true
  has_and_belongs_to_many :projects
  has_and_belongs_to_many :offers
  has_many :notes

  validates :family_name, presence: true
  validates :given_names, presence: true
end
