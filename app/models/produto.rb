class Produto < ApplicationRecord
    belongs_to :user
    has_many :produtoimagem
    accepts_nested_attributes_for :produtoimagem
    mount_uploader :imagem, ImageUploader
end
