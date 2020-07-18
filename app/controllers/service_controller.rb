class ServiceController < ApplicationController
    def index
    end
    
    def sm_services
        @services = Service.where(office_id: current_office.id, category_id: 2)
        # @services = Service.where("office_id = ? AND category_id = ?", current_office.id, 3)
    end
    
    def nd_services
        @services = Service.where(office_id: current_office.id, category_id: 3)
        # @services = Service.where("office_id = ? AND category_id = ?", current_office.id, 2)
    end
    
    def common_services
        @services = Service.where(office_id: current_office.id, category_id: 1)
        # @services = Service.where("office_id = ? AND category_id = ?", current_office.id, 1)
    end
    
    def new
        @service = Service.new
    end
    
    def create
        @service = Service.new(service_params)
        @service.office_id = current_office.id
        if @service.save
            flash[:succes] = "#{@service.name}を追加しました。"
            redirect_to service_index_path and return
        else
            flash[:danger] = ""
            @service.errors.full_messages.each do |e|
                flash[:danger] += e
            end
            redirect_to new_service_path and return
        end
    end
    
    def edit
        @service = Service.find(params[:id])
    end
    
    def update
        @service = Service.find(params[:id])
        if @service.update(service_params)
            flash[:success] = "サービスの内容を更新しました"
            redirect_to sm_services_service_path(current_office.id) and return
        else
            flash[:danger] = "更新に失敗しました。"
            redirect_to service_index_path(@service) and return
        end
    end
    
    def show
    end
    
    def destroy
        service = Service.find(params[:id])
        if service.destroy
            flash[:danger] = "#{service.name}を削除しました"
            redirect_to service_index_path and return
        end
    end
    
    private
    def service_params
        params.require(:service).permit(:name, :category_id, :price, :office_id)
    end
end

