class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :phone, :email, :website, :address, :customer_id, :additional_info
  has_many :contacts
end
