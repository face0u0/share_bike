class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table "active_admin_comments", force: :cascade do |t|
      t.string "namespace"
      t.text "body"
      t.string "resource_type"
      t.integer "resource_id"
      t.string "author_type"
      t.integer "author_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
      t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
      t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
    end

    create_table "admin_users", force: :cascade do |t|
      t.string "email", default: "", null: false
      t.string "encrypted_password", default: "", null: false
      t.string "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["email"], name: "index_admin_users_on_email", unique: true
      t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
    end

    create_table "bikes", force: :cascade do |t|
      t.string "name"
      t.integer "user_id"
      t.string "image"
      t.string "vehicle_num"
      t.string "security_num"
      t.integer "status", default: 0
      t.text "details"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.boolean "void", default: false
      t.index ["user_id"], name: "index_bikes_on_user_id"
    end

    create_table "tourist_bikes", force: :cascade do |t|
      t.integer "bike_id"
      t.integer "tourist_id"
      t.datetime "start_datetime"
      t.datetime "end_datetime"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer "place_id"
      t.integer "price"
      t.integer "status", default: 0
      t.boolean "void", default: false
      t.integer "transaction_id"
      t.index ["bike_id"], name: "index_tourist_bikes_on_bike_id"
      t.index ["tourist_id"], name: "index_tourist_bikes_on_tourist_id"
      t.index ["transaction_id"], name: "index_tourist_bikes_on_transaction_id"
    end

    create_table "tourists", force: :cascade do |t|
      t.string "name"
      t.string "email"
      t.boolean "temp_terms", default: false
      t.integer "terms", default: 0
      t.integer "tutorial", default: 0
      t.string "remember_digest"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "password_digest"
      t.boolean "authenticated"
      t.string "authenticate_url"
      t.datetime "authenticate_expire"
      t.boolean "void", default: false
    end

    create_table "transactions", force: :cascade do |t|
      t.string "order_id"
      t.string "authorization_id"
      t.integer "tourist_id"
      t.integer "amount"
      t.string "currency"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.boolean "voided" #should REMOVE
      t.string "payer_id"
      t.string "capture_ticket"
      t.string "capture_deposit"
      t.string "refund_ticket"
      t.string "refund_deposit"
      t.boolean "voided_all", default: false
      t.boolean "voided_deposit", default: false
      t.boolean "valid_ticket", default: false
      t.string "re_authorization_id"
      t.integer "ticket_amount"
      t.integer "deposit_amount"
      t.index ["tourist_id"], name: "index_transactions_on_tourist_id"
    end

    create_table "user_reviews", force: :cascade do |t|
      t.integer "user_id"
      t.integer "tourist_bike_id"
      t.integer "rate"
      t.text "comment"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["tourist_bike_id"], name: "index_user_reviews_on_tourist_bike_id"
      t.index ["user_id"], name: "index_user_reviews_on_user_id"
    end

    create_table "users", force: :cascade do |t|
      t.string "name"
      t.string "email"
      t.boolean "temp_terms", default: false
      t.integer "terms", default: 0
      t.integer "tutorial", default: 0
      t.string "remember_digest"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "password_digest"
      t.boolean "authenticated"
      t.string "authenticate_url"
      t.datetime "authenticate_expire"
      t.boolean "void", default: false
    end
  end
end
