class RedirectionsController < ApplicationController
  def index
      @redirections = Redirection.all
  end

  def new
  end
  
  def create
      if Redirection.create(create_params)
        flash[:notice] = "Successfully added"
        redirect_to redirections_path
      else
        render :action => 'new'
      end
  end

  def update_all
    Redirection.update_attr(params[:active_ids])  
    redirect_to :redirections
  end
  
  def show
  end

  def destroy
    Redirection.find(params[:id]).destroy
    redirect_to :redirections
  end

  private 
    def create_params
        params.require(:redirection).permit(:country,:hyperlink,:active)
    end
end
