# frozen_string_literal: true

module UsersHelper
  def current_user_name(user)
    [user.name, user.email].find(&:present?)
  end

  def user_name_or_email(user)
    user.name.presence || user.email
  end
end
