module OfficesHelper
    def user_sign_in(office)
        session[:office_id] = office.id
        # byebug
    end
    
    def user_sign_out
        # byebug
        session.delete(:office_id)
        @current_office = nil
    end
    
    def current_office
        if @current_office.nil?
            @current_office = Office.find_by(id: session[:office_id])
        else
            @current_office
        end
    end
    
    def office_sign_in?
        current_office.present?
    end
    
    def authorize
        redirect_to sign_in_path unless office_sign_in?
    end
    
    def redirect_to_top_if_signed_in
        redirect_to top_office_path(current_office) and return if office_sign_in?
    end
end
