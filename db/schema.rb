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

ActiveRecord::Schema.define(version: 20180923100915) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.integer "company_id"
    t.string "name"
    t.string "avatar"
    t.string "password_digest"
    t.boolean "is_main", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_accounts_on_company_id"
  end

  create_table "applicants", force: :cascade do |t|
    t.string "avatar"
    t.string "name"
    t.integer "age"
    t.string "sex"
    t.string "mobile"
    t.string "email"
    t.string "education"
    t.string "school"
    t.string "city"
    t.string "address"
    t.string "blog_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  create_table "companies", force: :cascade do |t|
    t.integer "industry_id"
    t.string "name"
    t.string "scale"
    t.string "desc"
    t.string "city"
    t.string "password_digest"
    t.string "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "待审核"
    t.string "audit_comment"
    t.index ["industry_id"], name: "index_companies_on_industry_id"
  end

  create_table "deliver_records", force: :cascade do |t|
    t.integer "job_id"
    t.integer "resume_id"
    t.string "state"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "industries", force: :cascade do |t|
    t.string "name"
    t.string "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.integer "company_id"
    t.string "name"
    t.string "worker_type"
    t.decimal "start_salary", precision: 4, scale: 1
    t.decimal "end_salary", precision: 4, scale: 1
    t.string "education"
    t.string "worker_experience"
    t.text "job_desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_jobs_on_company_id"
  end

  create_table "resumes", force: :cascade do |t|
    t.string "life_creed"
    t.string "brief_intro"
    t.string "career_experience"
    t.string "apply_reason"
    t.string "special_skill"
    t.string "project_experience"
    t.integer "applicant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
  end

end
