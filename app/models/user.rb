class User < ActiveRecord::Base
  
  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end
  
  has_many :authentications, :dependent => :destroy
  accepts_nested_attributes_for :authentications
  
  attr_accessible :email, :email_confirmation, :password, :password_confirmation, 
    :terms_accepted , :authentications_attributes,
    :first_name, :last_name, :is_owner
  
  validates_presence_of :password, :on => :create
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates_uniqueness_of :email
  validates_length_of :password, :minimum => 6, :message =>  "must be at least 6 characters long", :if => :password
  validates_confirmation_of :password, :message => "should match confirmation", :if => :password
  validates_confirmation_of :email, :message => "should match confirmation", :if => :email
  
  validate :validate_terms
  
  private

  def validate_terms
      if !terms_accepted
        self.errors.add :base, "Terms and conditions need to be accepted"
      end
  end
end
