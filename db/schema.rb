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

ActiveRecord::Schema[7.0].define(version: 2022_05_12_195610) do
  create_table "adherents", force: :cascade do |t|
    t.string "nom"
    t.string "prenom"
    t.string "email"
    t.string "password_digest"
    t.integer "quota"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "auteurs", force: :cascade do |t|
    t.string "nom"
    t.string "prenom"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", force: :cascade do |t|
    t.integer "auteur_id", null: false
    t.integer "adherent_id", null: false
    t.string "code"
    t.string "titre"
    t.integer "categorie"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["adherent_id"], name: "index_documents_on_adherent_id"
    t.index ["auteur_id"], name: "index_documents_on_auteur_id"
  end

  create_table "materiels", force: :cascade do |t|
    t.integer "adherent_id", null: false
    t.string "code"
    t.integer "type"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["adherent_id"], name: "index_materiels_on_adherent_id"
  end

  create_table "respos", force: :cascade do |t|
    t.string "nom"
    t.string "prenom"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "documents", "adherents"
  add_foreign_key "documents", "auteurs"
  add_foreign_key "materiels", "adherents"
end
