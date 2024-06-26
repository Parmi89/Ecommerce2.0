module Login
  extend ActiveSupport::Concern

  included do
    attr_writer :login
    validates :username, presence: true, uniqueness: { case_sensitive: false }

    def login
      @login || self.username || self.email
    end

    def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if (login = conditions.delete(:login))
        where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      elsif conditions.has_key?(:username) || conditions.has_key?(:email)
        where(conditions.to_h).first
      end
    end
  end
 
end




