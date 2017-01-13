class Owner < ApplicationRecord
  rolify
  after_create :assign_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:twitter]

  has_many :apartments

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |owner|
      owner.email = auth.uid + "@twitter.com"
      owner.password = Devise.friendly_token[0,20]
    end
  end

  def assign_role
    add_role(:poster)
  end


end
