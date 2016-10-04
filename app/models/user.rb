class User < ApplicationRecord
has_many :recipes

  # CONSTANTS
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # MIXINS
  has_secure_password

  # ASSOCIATIONS
  has_many :recipes, dependent: :nullify

  # VALIDATIONS
  validates :email,
  presence: true,
  length: { maximum: 255},
  uniqueness: {case_sensitive: false},
  format: VALID_EMAIL_REGEX

  validates :password,
  length: { in: 8..72 },
  on: :create


  # HOOKS
    before_save :downcase_fields

  # PUBLIC METHODS
    def self.authenticate(params)
      User.find_by_email(params[:email]).try(:authenticate, params[:password])
      end
    end
