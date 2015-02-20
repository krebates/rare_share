class ConnectionsController < ApplicationController
  def create
    @connection = current_user.connections.build(connect_id: params[:connect_id])
    if @connection.save
      flash[:notice] = "Your friend was successfully added."
      redirect_to :back
    end


    def destroy
      @connection = current_user.connections.find(params[:connection_id])
      @connection.destroy
      flash[:notice] = "You have removed this connection."
      redirect_to :back
    end
  end
end
