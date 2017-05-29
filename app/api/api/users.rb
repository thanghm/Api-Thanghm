module API
  class Users < Grape::API
    namespace :users do
      desc 'User authentication',
        notes: "
          ## Error code:
          * #{I18n.t("error_code.wrong_login_detail")}: #{I18n.t("errors.wrong_login_detail")}
          * #{I18n.t("error_code.user_has_been_deleted")}: #{I18n.t("errors.user_has_been_deleted")}
        ",
        entity: Entities::User,
        http_codes: [
          [200, I18n.t("success.login"), Entities::User]
        ]

      params do
        requires :email        , type: String, desc: "User's email"
        requires :password     , type: String, desc: "User's password"
      end
      post :login do
        user = User.find_by(email: params[:email])
        if user.nil?
          if User.find_by(email: params[:email]).nil?
            return response_error I18n.t("errors.wrong_login_detail"), I18n.t("error_code.wrong_login_detail")
          end
          return response_error I18n.t("errors.user_has_been_deleted"), I18n.t("error_code.user_has_been_deleted")
        end

        unless user.valid_password?(params[:password])
          return response_error I18n.t("errors.wrong_login_detail"), t("error_code.wrong_login_detail")
        end

        user.ensure_authentication_token!
        response_success I18n.t("success.login"), Entities::User.represent(user)
      end

      desc 'Sign out',
        notes: "
          ## Error code:

          * #{I18n.t("error_code.unauthorized")}: #{I18n.t("error.unauthorized")}

        ",
        http_codes: [
          [200, I18n.t("success.logout")]
        ],
        headers: {
          "UserToken" => {
            description: "User's authentication_token",
            type: String,
            required: true
          }
        }
      params do
      end
      post :logout do
        authenticate_user
        current_user.clear_authentication_token
        response_success I18n.t("success.logout"), ''
      end

      desc 'Send reset password instructions',
        notes: "
          ## Error code:

          * #{I18n.t("error_code.unauthorized")}: #{I18n.t("error.unauthorized")}

        "
      params do
        requires :email        , type: String, desc: "User's email"
      end
      get :forgot_password do
        @user = User.display.find_by_email(params[:email])
        if @user.present?
          @user.send_reset_password_instructions
        end
        return response_success I18n.t("success.forgot_password")
      end
    end
  end
end