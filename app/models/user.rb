class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # This gives admin rights to the first sign-up.
  # Just remove it if you don't want that
  before_create { |user| user.administrator = true if !Rails.env.test? && count == 0 }


  # --- Signup lifecycle --- #

  # lifecycle do

  #   state :active, :default => true

  #   create :signup, :available_to => "Guest",
  #          :params => [:name, :email_address, :password, :password_confirmation],
  #          :become => :active

  #   transition :request_password_reset, { :active => :active }, :new_key => true do
  #     UserMailer.deliver_forgot_password(self, lifecycle.key)
  #   end

  #   transition :reset_password, { :active => :active }, :available_to => :key_holder,
  #              :params => [ :password, :password_confirmation ]

  # end


  # --- Permissions --- #
  # Not sure these are needed at all...

  # def create_permitted?
  #   false
  # end

  # def update_permitted?
  #   acting_user.administrator? ||
  #     (acting_user == self && only_changed?(:email_address, :crypted_password,
  #                                           :current_password, :password, :password_confirmation))
  #   # Note: crypted_password has attr_protected so although it is permitted to change, it cannot be changed
  #   # directly from a form submission.
  # end

  # def destroy_permitted?
  #   acting_user.administrator?
  # end

  # def view_permitted?(field)
  #   true
  # end

end
