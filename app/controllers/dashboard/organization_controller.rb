class Dashboard::OrganizationController < ApplicationController
  def index
   @organization = Organization.all
   organization = Organization.new
  end 
  
  def create
   organization = Organization.new(create_organization_params)
     
   if current_user.organization_id.nil?
        if organization.save!
            last_organization = Organization.last
            user = User.find(current_user.id.to_i)
            user.organization_id = last_organization.id
            redirect_to dashboard_organization_index_path if user.save! 
        else
            redirect_to dashboard_organization_index_path
        end 
   else
    render 'index' 
   end 
  end

  def edit
   @organization = Organization.find(params[:id].to_i)  
  end

  def update
    current_user_id = params[:leave_organization][:id].to_i
    user = User.find(current_user_id)
    user.organization_id = nil
    redirect_to dashboard_organization_index_path if user.save!   
  end  
  
  def edit_organization
   @organization = Organization.find(params[:id].to_i)
   $id = params[:id]
  end

  def update_organization
   name = params[:organization][:name]
   rate = params[:organization][:hourly_rate]
   organization  = Organization.find($id.to_i)
   organization.name = name
   organization.hourly_rate = rate
   redirect_to dashboard_organization_index_path if organization.save!
  end
  
  def join_organization
   current_user_id = params[:current_user_id].to_i
   organization_id = params[:organization_id].to_i
   user = User.find(current_user_id)
   if user.organization_id == nil
      user.organization_id = organization_id
      user.save!
      render json: "successfuly join".to_json
   else
      render json: "failed to join".to_json
   end 
  end   
   
  private
   def create_organization_params
    params.require(:organization).permit(:name, :hourly_rate)
   end
   
   def leave_organization_params
    params.require(:leave_organization).permit(:id)
   end 
end
