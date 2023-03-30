class Candidate < ActiveRecord::Base
    paginates_per 2
    include PgSearch::Model
    pg_search_scope :global_search, against: [:first_name, :last_name, :category, :current_location, :address, :primary_skill, :secondary_skill], using: { tsearch: { prefix: true } }
    # extend FriendlyId
    # friendly_id :first_name
    # has_one_attached :image
    default_scope { order(created_at: :desc) }
    has_many :lead_assignments
    has_many :comments
    has_many :users, through: :comments
    has_rich_text :content
    mount_uploader :file, FileUploader
    mount_uploader :updated_file, UpdatedFileUploader
    mount_uploader :image, ImageUploader
    GENDER_LIST = ["Male", "Female", "Other"]
    LANGUAGE_LIST = ["Basic English", "Medium English", "Fluent English", "Native English"]
    MARITAL_LIST = ["Married", "Unmarried"]
    LOCATION_LIST = ["Maharshtra", "Madhya Pradesh", "Uttar Pradesh"]
    NATIONALITY_LIST = ["United Kingdom", "Austria", "Bahrain", "Canada", "Denmark", "Germany"]
    CATEGORY_LIST = ["Backend Developer", "Cloud Computing", "DevOps Engineer", "Desktop Developer", "Database Developer", "Frontend Developer", "Full-Stack Developer", "Mobile Developer", "Security Engineer", "SEO", "UX/UI Designer", "Web Developer", "ROR Developer"]
    LEVEL_OF_EDUCATION_LIST = ["Primary Education", "Higher Secondary Education", "Under-Graduate", "Post-Graduate", "Doctoral studies"]
    DEGREE_LIST = ["SEE", "M.A.", "Enginery of CSE", "Master", "Associate", "Graduate"]
    RESULT_LIST = ["First Class", "Second Class", "Third Class"]
    YEAR_OF_PASSING_LIST = ["2020", "2021", "2022", "2023", "2024", "2025"]
    EMPLOYMENT_PERIOD_LIST = ["2020", "2021", "2022", "2023", "2024", "2025"]
    CANDIDATE_STATUS = ["Draft", "Active"]
    TIME_ZONE_LIST = ["AST", "EST", "CST", "IST", "MST", "PST", "AKST", "HST", "UTC-11", "UTC+10"]
    EXPERIENCE_LIST = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15"]
    validates :first_name,:last_name, :phone, :gender, :address, presence: true
    validates :email, presence: true, format: { with: Devise.email_regexp }

end
