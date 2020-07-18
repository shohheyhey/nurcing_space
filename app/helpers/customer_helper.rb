module CustomerHelper
    def image_url(user)
        if user.image.present?
            user.image.url
        else
            "https://dummyimage.com/200x200/000/fff"
            
        end
    end
    
    def age(user)
        (Date.today.strftime("%Y%m%d").to_i - user.birth.strftime("%Y%m%d").to_i)/10000
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
