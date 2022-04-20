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

ActiveRecord::Schema[7.0].define(version: 2022_04_20_082743) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_affiliations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "account_id", null: false
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_account_affiliations_on_account_id"
    t.index ["user_id"], name: "index_account_affiliations_on_user_id"
  end

  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "username"
    t.string "category"
    t.index ["slug"], name: "index_accounts_on_slug", unique: true
  end

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "article_comment_votes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "article_comment_id", null: false
    t.integer "choice", limit: 2, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_comment_id"], name: "index_article_comment_votes_on_article_comment_id"
    t.index ["user_id"], name: "index_article_comment_votes_on_user_id"
  end

  create_table "article_comments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "article_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_article_comments_on_article_id"
    t.index ["user_id"], name: "index_article_comments_on_user_id"
  end

  create_table "articles", force: :cascade do |t|
    t.bigint "channel_id", null: false
    t.string "title"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["channel_id"], name: "index_articles_on_channel_id"
    t.index ["slug"], name: "index_articles_on_slug", unique: true
  end

  create_table "channel_affiliations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "channel_id", null: false
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id"], name: "index_channel_affiliations_on_channel_id"
    t.index ["user_id"], name: "index_channel_affiliations_on_user_id"
  end

  create_table "channels", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.string "name"
    t.string "privacy"
    t.integer "subscribers"
    t.string "main_community"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "publicid"
    t.string "library_privacy", default: "private"
    t.index ["account_id"], name: "index_channels_on_account_id"
    t.index ["slug"], name: "index_channels_on_slug", unique: true
  end

  create_table "communities", force: :cascade do |t|
    t.bigint "channel_id", null: false
    t.string "name"
    t.string "privacy"
    t.string "publicid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["channel_id"], name: "index_communities_on_channel_id"
    t.index ["slug"], name: "index_communities_on_slug", unique: true
  end

  create_table "community_affiliations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "community_id", null: false
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["community_id"], name: "index_community_affiliations_on_community_id"
    t.index ["user_id"], name: "index_community_affiliations_on_user_id"
  end

  create_table "community_comment_votes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "article_comment_id", null: false
    t.integer "choice", limit: 2, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_comment_id"], name: "index_community_comment_votes_on_article_comment_id"
    t.index ["user_id"], name: "index_community_comment_votes_on_user_id"
  end

  create_table "community_comments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "community_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["community_id"], name: "index_community_comments_on_community_id"
    t.index ["user_id"], name: "index_community_comments_on_user_id"
  end

  create_table "course_affiliations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "course_id", null: false
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_affiliations_on_course_id"
    t.index ["user_id"], name: "index_course_affiliations_on_user_id"
  end

  create_table "course_items", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.string "name"
    t.string "category"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_items_on_course_id"
  end

  create_table "courses", force: :cascade do |t|
    t.bigint "channel_id", null: false
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["channel_id"], name: "index_courses_on_channel_id"
    t.index ["slug"], name: "index_courses_on_slug", unique: true
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "lesson_comments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "lesson_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_lesson_comments_on_lesson_id"
    t.index ["user_id"], name: "index_lesson_comments_on_user_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.string "title"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_lessons_on_course_id"
  end

  create_table "library_folders", force: :cascade do |t|
    t.bigint "channel_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id"], name: "index_library_folders_on_channel_id"
  end

  create_table "library_items", force: :cascade do |t|
    t.bigint "library_folder_id", null: false
    t.string "category"
    t.integer "itemid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["library_folder_id"], name: "index_library_items_on_library_folder_id"
  end

  create_table "question_comment_votes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "question_comment_id", null: false
    t.integer "choice"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_comment_id"], name: "index_question_comment_votes_on_question_comment_id"
    t.index ["user_id"], name: "index_question_comment_votes_on_user_id"
  end

  create_table "question_comments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_question_comments_on_question_id"
    t.index ["user_id"], name: "index_question_comments_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.string "locale"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "video_comment_votes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "video_comment_id", null: false
    t.integer "choice", limit: 2, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_video_comment_votes_on_user_id"
    t.index ["video_comment_id"], name: "index_video_comment_votes_on_video_comment_id"
  end

  create_table "video_comments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "video_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_video_comments_on_user_id"
    t.index ["video_id"], name: "index_video_comments_on_video_id"
  end

  create_table "videos", force: :cascade do |t|
    t.bigint "channel_id", null: false
    t.string "title"
    t.integer "score"
    t.boolean "visible"
    t.string "publicid"
    t.string "playback_id"
    t.string "policy"
    t.string "mux_asset_id"
    t.string "status"
    t.string "max_stored_resolution"
    t.float "max_stored_frame_rate"
    t.float "duration"
    t.string "aspect_ratio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.integer "privacy"
    t.index ["channel_id"], name: "index_videos_on_channel_id"
    t.index ["slug"], name: "index_videos_on_slug", unique: true
  end

  add_foreign_key "account_affiliations", "accounts"
  add_foreign_key "account_affiliations", "users"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "article_comment_votes", "article_comments"
  add_foreign_key "article_comment_votes", "users"
  add_foreign_key "article_comments", "articles"
  add_foreign_key "article_comments", "users"
  add_foreign_key "articles", "channels"
  add_foreign_key "channel_affiliations", "channels"
  add_foreign_key "channel_affiliations", "users"
  add_foreign_key "channels", "accounts"
  add_foreign_key "communities", "channels"
  add_foreign_key "community_affiliations", "communities"
  add_foreign_key "community_affiliations", "users"
  add_foreign_key "community_comment_votes", "article_comments"
  add_foreign_key "community_comment_votes", "users"
  add_foreign_key "community_comments", "communities"
  add_foreign_key "community_comments", "users"
  add_foreign_key "course_affiliations", "courses"
  add_foreign_key "course_affiliations", "users"
  add_foreign_key "course_items", "courses"
  add_foreign_key "courses", "channels"
  add_foreign_key "lesson_comments", "lessons"
  add_foreign_key "lesson_comments", "users"
  add_foreign_key "lessons", "courses"
  add_foreign_key "library_folders", "channels"
  add_foreign_key "library_items", "library_folders"
  add_foreign_key "question_comment_votes", "question_comments"
  add_foreign_key "question_comment_votes", "users"
  add_foreign_key "question_comments", "questions"
  add_foreign_key "question_comments", "users"
  add_foreign_key "questions", "users"
  add_foreign_key "video_comment_votes", "users"
  add_foreign_key "video_comment_votes", "video_comments"
  add_foreign_key "video_comments", "users"
  add_foreign_key "video_comments", "videos"
  add_foreign_key "videos", "channels"
end
