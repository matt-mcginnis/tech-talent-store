class ApplicationController < ActionController::Base

    before_action :categories, :brands

    def categories
        @categories = Category.order(:name)
    end

    def brands
        @brands = Product.pluck(:brand).sort.uniq
    end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :role)}

        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :role)}
    end
end
