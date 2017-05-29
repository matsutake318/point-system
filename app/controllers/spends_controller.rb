
class SpendsController < ApplicationController

def create

   Spend.create(spend_params)
   @user_id = params[:spend][:user_id]
   @user = User.find(@user_id)
   redirect_to @user
end

private

  def spend_params
    params.require(:spend).permit(:user_id, :point)
  end

end