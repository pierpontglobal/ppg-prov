class User < ApplicationRecord

  VALID_USERNAME_REGEX = /\A(?=.{4,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])\z/.freeze

  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, uniqueness: true
  validates :username, format: { with: VALID_USERNAME_REGEX }
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }

  has_and_belongs_to_many :apps

  def sanitized_info
    {
      id: id,
      first_name: first_name,
      last_name: last_name,
      username: username,
      email: email
    }
  end
end
