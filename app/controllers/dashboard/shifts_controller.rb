class Dashboard::ShiftsController < ApplicationController
 def index    
   
 end   

 def edit
   user = User.where(organization_id:params[:id].to_i)
   user.each do |user|
     user_id = user.id
     @shifts = Shift.where(user_id:user_id)
   
   end  
 end  
 
 def update
   user_id      = params[:shift][:user_id].to_i
   created_at   = params[:shift][:created_at]
   start        = params[:shift][:start] 
   ends         = params[:shift][:end]
   break_length = params[:shift][:break_length]
   
   shift = Shift.new
   
   shift.user_id    = user_id
   shift.created_at = created_at
   shift.start      = start
   shift.finish     = ends
   shift.break_length =  break_length.to_i
   shift.save!
   pp shift.errors.full_messages
 end 

end
