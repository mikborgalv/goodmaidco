class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :accounts, dependent: :destroy
  has_many :feedbacks, dependent: :nullify
  has_many :locations, through: :accounts
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  has_many :partners, -> { where(role: 'provider') }, dependent: :destroy, inverse_of: :user
  
  def admin?
    role == 'admin'
  end


      # Role-based methods for authorization
      def admin?
        role == 'admin'
      end
    
      def user?
        role == 'user'
      end

  def self.ransackable_associations(auth_object = nil)
        ["accounts", "partner"]
  end
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "encrypted_password", "id", "remember_created_at", "reset_password_sent_at", "reset_password_token", "role", "updated_at"]
  end

  before_save :downcase_email

  private
  def downcase_email
    self.email = email.downcase 
  end


end
