class User < ActiveRecord::Base
  authenticates_with_sorcery!
  
  attr_accessible :email, :email_confirmation, :password, :password_confirmation, :terms_accepted


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
    # one or the other must be provided
      if !terms_accepted
        self.errors.add :base, "You must accept the terms and conditions"
      end
  end
end
