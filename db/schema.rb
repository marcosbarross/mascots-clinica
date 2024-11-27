# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_11_27_225129) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animals", force: :cascade do |t|
    t.string "nome"
    t.integer "idade"
    t.string "especie"
    t.string "raca"
    t.float "peso"
    t.bigint "tutor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tutor_id"], name: "index_animals_on_tutor_id"
  end

  create_table "cargos", force: :cascade do |t|
    t.string "nome_cargo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "consultas", force: :cascade do |t|
    t.bigint "funcionario_id"
    t.bigint "animal_id", null: false
    t.date "data"
    t.time "hora"
    t.text "observacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["animal_id"], name: "index_consultas_on_animal_id"
    t.index ["funcionario_id"], name: "index_consultas_on_funcionario_id"
  end

  create_table "estoque_internamentos", force: :cascade do |t|
    t.bigint "internamento_id", null: false
    t.string "medicamento"
    t.float "quantidade_disponivel"
    t.float "quantidade_utilizada"
    t.float "quantidade_minima"
    t.string "fornecedor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["internamento_id"], name: "index_estoque_internamentos_on_internamento_id"
  end

  create_table "estoque_vendas", force: :cascade do |t|
    t.string "medicamento"
    t.decimal "preco"
    t.integer "quantidade_disponivel"
    t.integer "quantidade_venda"
    t.string "fornecedor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exames", force: :cascade do |t|
    t.bigint "consulta_id", null: false
    t.string "nome_exame"
    t.string "status_exame"
    t.text "resultado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["consulta_id"], name: "index_exames_on_consulta_id"
  end

  create_table "funcionarios", force: :cascade do |t|
    t.string "nome"
    t.string "contato"
    t.string "login"
    t.string "senha"
    t.bigint "cargo_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["cargo_id"], name: "index_funcionarios_on_cargo_id"
    t.index ["user_id"], name: "index_funcionarios_on_user_id"
  end

  create_table "internamentos", force: :cascade do |t|
    t.bigint "consulta_id", null: false
    t.date "data_inicio"
    t.date "data_fim"
    t.string "medicamento"
    t.float "quantidade_medicamento"
    t.text "obs_monitoramento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["consulta_id"], name: "index_internamentos_on_consulta_id"
  end

  create_table "prescricao_medicas", force: :cascade do |t|
    t.bigint "consulta_id", null: false
    t.date "data"
    t.string "medicamentos_prescritos"
    t.string "dosagens"
    t.text "observacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["consulta_id"], name: "index_prescricao_medicas_on_consulta_id"
  end

  create_table "tutors", force: :cascade do |t|
    t.string "nome"
    t.string "endereco"
    t.string "telefone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.boolean "allow_password_change", default: false
    t.json "tokens"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "animals", "tutors"
  add_foreign_key "consultas", "animals"
  add_foreign_key "consultas", "funcionarios"
  add_foreign_key "estoque_internamentos", "internamentos"
  add_foreign_key "exames", "consultas"
  add_foreign_key "funcionarios", "cargos"
  add_foreign_key "funcionarios", "users"
  add_foreign_key "internamentos", "consultas"
  add_foreign_key "prescricao_medicas", "consultas"
end
