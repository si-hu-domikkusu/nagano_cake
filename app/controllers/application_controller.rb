class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_orders_path          #pathは設定したい遷移先へのpathを指定してください
    when Customer
      homes_top_path              #ここもpathはご自由に変更してください
    end
  end
  
  def
  after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :customer
        root_path
    elsif resource_or_scope == :admin
        new_admin_session_path
    else
        root_path
    end
  end

# def after_sign_out_path_for(resource_or_scope)
#     if resource_or_scope == :admin_admin_customer
#       homes_top_path
#     else
#       new_admin_session_path

#     end
# end

  # def after_sign_in_path_for(resource)
  # homes_top_path
  # end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :kana_last_name, :kana_first_name, :email, :postal_code, :address, :phone_number])
  end

end
