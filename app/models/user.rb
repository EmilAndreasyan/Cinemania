class User < ApplicationRecord
  has_secure_password
  has_many :movies
  has_many :artists, through: :movies
  has_many :genres, through: :movies

  accepts_nested_attributes_for :movies
  accepts_nested_attributes_for :artists
  accepts_nested_attributes_for :genres

  validates_presence_of :email, uniqueness: true, format: { with: /\w+@\w+\.{1}[a-zA-Z]{2,}/ } # VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :first_name, length: {minimum: 4}, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :password, :password_confirmation, length: {in: 3..20}

  def self.find_or_create_by_omniauth(auth_hash) # auth_hash from session controller
    self.where(:email => auth_hash["info"]["nickname"]).first_or_create do |user| # email is nil
      user.email = auth_hash["info"]["nickname"]
      user.password = SecureRandom.hex
    end
  end

end
