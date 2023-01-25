class Candidate < ApplicationRecord
    include PgSearch::Model
    pg_search_scope :global_search, against: [:first_name, :last_name], using: { tsearch: { prefix: true } }
    extend FriendlyId
    friendly_id :first_name
    has_one_attached :image
    mount_uploader :file, FileUploader
    GENDER_LIST = ["Male", "Female", "Other"]
    MARITAL_LIST = ["Married", "Unmarried"]
    NATIONALITY_LIST = ["United Kingdom", "Austria", "Bahrain", "Canada", "Denmark", "Germany"]
    CATEGORY_LIST = ["UX/UI Designer", "Web Developer", "Web Designer", "Software Developer", "SEO"]
    LEVEL_OF_EDUCATION_LIST = ["Massachusetts", "Maryland", "Colorado", "Vermont", "Virginia", "Washington"]
    DEGREE_LIST = ["SEE", "M.A.", "Enginery of CSE", "Master", "Associate", "Graduate"]
    RESULT_LIST = ["First Class", "Second Class", "Third Class"]
    YEAR_OF_PASSING_LIST = ["2020", "2021", "2022", "2023", "2024", "2025"]
    EMPLOYMENT_PERIOD_LIST = ["2020", "2021", "2022", "2023", "2024", "2025"]
    CANDIDATE_STATUS = ["Draft", "Active"]
    validates :first_name, presence: true#, acceptance: {message: "Please enter a valid name."}
    validates :last_name, presence: true
    validates :email, presence: true, format: { with: Devise.email_regexp }
end
