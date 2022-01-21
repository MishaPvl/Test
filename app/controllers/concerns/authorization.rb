module Authorization
  extend ActiveSupport::Concern

  included do
    include Pundit

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    private

    def user_not_authorized
      flash[:danger] = t 'global.flash.not_authorized'
      redirect_to(request.referer || login_user_path)
    end
  end
end