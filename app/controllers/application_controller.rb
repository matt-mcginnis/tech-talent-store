class ApplicationController < ActionController::Base

    before_action :categories, :brands, :line_items
    after_action :line_items

    helper_method :current_order

    def categories
        @categories = Category.order(:name)
    end

    def brands
        @brands = Product.pluck(:brand).sort.uniq
    end

    def line_items
        @order = current_order
    end

      def current_order
        if !session[:order_id].nil?
          Order.find(session[:order_id])
        else
          Order.new
        end
      end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :role)}

        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :role)}
    end
end
