module CheckAdmin
  extend ActiveSupport::Concern

  included do
    def check_admin
      unless current_admin 
        redirect_to products_path, alert: t('common.not_admin')
      end
    end  
  end
end


