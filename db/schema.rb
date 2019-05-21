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

ActiveRecord::Schema.define(version: 20190521184223) do

  create_table "enderecos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
  end

  create_table "users", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nome"
    t.string "email"
    t.string "zap"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.integer "user_level", null: false
    t.integer "enderecoID"
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

  add_foreign_key "vendas", "produtos", column: "idproduto", name: "idproduto"
  add_foreign_key "vendas", "users", column: "idcomprador", name: "idcomprador"
  add_foreign_key "vendas", "users", column: "idvendedor", name: "idvendedor"
end
