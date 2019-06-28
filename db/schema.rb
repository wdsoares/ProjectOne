# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20190628082750) do

  create_table "compras", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "denuncia", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "id_delator", null: false
    t.integer "idAnuncio", null: false
    t.index ["idAnuncio"], name: "idAnuncio_idx"
    t.index ["id_delator"], name: "id_delator_idx"
  end

  create_table "enderecos", id: :integer, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "rua"
    t.string "numero"
    t.string "complemento"
    t.string "cep"
    t.string "bairro"
    t.string "cidade"
    t.string "uf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "forgotpwds", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "homes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "produtoimagems", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "produto_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "imagem", null: false
    t.index ["produto_id"], name: "produto_id_idx"
  end

  create_table "produtos", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "titulo", limit: 100
    t.string "autores", limit: 100, null: false
    t.integer "edicao"
    t.string "data_pub", limit: 15
    t.string "isbn", limit: 15
    t.string "editora", limit: 40
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.integer "visivel", null: false
    t.string "produtoimagem"
  end

  create_table "users", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nome"
    t.string "email"
    t.string "zap"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.integer "user_level", null: false
    t.integer "enderecoID", null: false
    t.index ["enderecoID"], name: "enderecoID_idx"
  end

  create_table "vendas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "idcomprador", null: false
    t.integer "idvendedor", null: false
    t.integer "idproduto", null: false
    t.index ["idcomprador"], name: "idcomprador_idx"
    t.index ["idproduto"], name: "idproduto_idx"
    t.index ["idvendedor"], name: "idvendedor_idx"
  end

  add_foreign_key "denuncia", "produtos", column: "idAnuncio", name: "idAnuncio"
  add_foreign_key "denuncia", "users", column: "id_delator", name: "id_delator"
  add_foreign_key "produtoimagems", "produtos", name: "produto_id", on_delete: :cascade
  add_foreign_key "users", "enderecos", column: "enderecoID", name: "enderecoID"
  add_foreign_key "vendas", "produtos", column: "idproduto", name: "idproduto"
  add_foreign_key "vendas", "users", column: "idcomprador", name: "idcomprador"
  add_foreign_key "vendas", "users", column: "idvendedor", name: "idvendedor"
end
