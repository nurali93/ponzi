class Users::SessionsController < Devise::SessionsController
# before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    session[:return_to] = params[:return_to] if params[:return_to]
    super
  end

  # POST /resource/sign_in
  def create
    super do |user|
      if user
        session[:user_id] = user.id
        if session[:return_to]
          redirect_to session[:return_to]
          session[:return_to] = nil
        else
          redirect_to root_url
        end
        return
      end
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
