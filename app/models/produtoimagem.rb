class Produtoimagem < ApplicationRecord
    mount_uploader :imagem, ImageUploader
    belongs_to :produto
end
