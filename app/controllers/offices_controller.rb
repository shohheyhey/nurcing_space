class OfficesController < ApplicationController
    
    # before_action :authorize, except:[:sign_up, :sign_up_process, :sign_in, :sign_in_process]
    # before_action :redirect_to_top_if_signed_in, only:[:sign_up, :sign_in]
    def sign_up
        @office = Office.new
        render layout: "for_top"
    end
    
    def sign_up_process
        @office = Office.new(office_params)
        if @office.save
            user_sign_in(@office)
            flash[:success] = "新規登録しました"
            redirect_to top_office_path(@office.id) and return
        else
            # flash[:danger] = ""
            # @office.errors.full_messages.each do |e|
            #     flash[:danger] += e
            # end
            flash[:danger] = @office.errors.full_messages.join(',')
            redirect_to sign_up_path and return
        end
    end
    
    def sign_in
        @office = Office.new
        render layout: "for_top"
    end
    
    def sign_in_process
        @office = Office.find_by(email: office_params[:email])
        if @office.present?
            office_password = @office.authenticate(office_params[:password])
            if office_password
                user_sign_in(@office)
                flash[:success] = "ログインしました"
                redirect_to top_office_path(@office.id) and return
            else
                flash[:danger] = "パスワードに誤りがあります。"
                redirect_to sign_in_path and return
            end
        else
            flash[:danger] = "メールアドレスに誤りがあります。"
            redirect_to sign_in_path and return
        end
    end
    
    def sign_out
        user_sign_out
        redirect_to sign_in_path and return
    end
    
    def top
        @office = Office.find(params[:id])
    end
    


    private
    def office_params
        params.require(:office).permit(:name, :email, :adress, :tell, :password, :password_confirmation)
    end
end
