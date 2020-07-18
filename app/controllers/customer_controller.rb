class CustomerController < ApplicationController
    before_action :authorize, except:[:sign_up, :sign_up_process, :sign_in, :sign_in_process]
    # before_action :redirect_to_top_if_signed_in, only:[:list]
    def list
        # byebug
        @office = Office.find(params[:id])
        @customers= Customer.where(office_id: params[:id])
        # @customers = Customer.all
        
    end
    
    def top
        # @office = Office.find(params[:id])
    end
    
    def edit
        @user =Customer.find(params[:id])
        @service_ids = CustomerService.where(customer_id: @user.id)
    end
    
    def update
        @user = Customer.find(params[:id])
        if @user.update(customer_params)
            if params[:customer][:service_id].present?
                customer_servce_params = params.require(:customer).permit(service_id:[])
                service_ids = customer_servce_params[:service_id]
                # byebug
                CustomerService.where(customer_id: @user.id).destroy_all
                service_ids.each do |s|
                    CustomerService.create(customer_id: @user.id, service_id: s.to_i)
                end
            end
            flash[:success] = "お客様情報を更新しました"
            redirect_to customer_path(@user) and return
        else
            flash[:danger] = ""
            @user.errors.full_messages do |e|
                flash[:danger] += e
            end
        end
        
    end
    
    def index
    end
    
    def new
        @user = Customer.new
    end
    
    def create
        @user = Customer.new(customer_params)
        @user.office_id = current_office.id
        
        if @user.save
            if params[:customer][:service_id].present?
                customer_service_params = params.require(:customer).permit(service_id:[])
                # byebug    
                service_ids = customer_service_params[:service_id]
                service_ids.each do |s|
                    CustomerService.create(customer_id: @user.id, service_id: s.to_i)
                end
            end
            # CustomerService.create(customer_id: @user.id, service_id: params[:service_id])
            flash[:success] = "新しいお客様を追加しました。"
            redirect_to customers_list_office_path(current_office.id) and return
        else
            # flash[:danger] = ""
            # @user.errors.full_messages.each do |e|
            #     flash[:danger] += e
            # end
            flash[:danger] = @user.errors.full_messages.join(',')
            redirect_to new_customer_path and return
        end
    end
    
    def show 
        # byebug
        @user = Customer.find(params[:id])
        # services = CustomerService.where(customer_id: params[:id])
        # @user_services = Service.where()
    end
    
    def claim
        @user = Customer.find(params[:id])

    end
    
    def destroy
        # byebug
        @user = Customer.find(params[:id])
        # @user.destroy
        flash[:success] = "#{@user.name}様を削除しました"
        # byebug
        redirect_to customers_list_office_path(current_office)
    end
    
    def delete
        @user = Customer.find(params[:id])
        @user.destroy
        flash[:success] = "#{@user.name}様を削除しました"
        redirect_to customers_list_office_path(current_office)
    end

    
    private
    def customer_params
        params.require(:customer).permit(:image, :name, :age, :birth, :adress, :kaigodo, :category_id, :kioreki, :description)
    end
    def customer_servce_params
        params.permit(:customer_service).permit(:customer_id,:service_id)
    end
    
end
