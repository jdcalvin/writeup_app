class ContentsController < ApplicationController
  before_action :signed_in_user
  before_action :set_content, only: [:show, :edit, :update, :destroy]
  before_action :admin_user,  only: [:edit, :destroy]
  

#TIRE
  #def index
   # if params[:query].present?
    #  @contents = Content.search(params[:query], load: true)
    #else
    #  @contents = Content.all
    #end
#end

  def index
   
    @contents = Content.search(params[:search])  
    
  end


  def show
    @content = Content.find(params[:id])
  end

  def new
    @content = Content.new
  end

  def edit

  end

  
  def create
    @content = Content.new(content_params)

    if @content.save
      redirect_to @content 
      flash[:success] = "Exception was successfully created."   
    else
      render action: 'new'  
    end
  end

  def update
    if @content.update(content_params)
      redirect_to @content
      flash[:success] = "Exception was successfully updated."      
    else
      render action: 'edit'       
    end
  end

  def destroy
    @content.destroy
    redirect_to contents_url 
    flash[:info] = "Exception deleted."   
  end
  
        
  def import
    Content.import(params[:file])
    redirect_to contents_url 
    flash[:success] =  "Exceptions imported."
  end

  private

    def set_content
      @content = Content.find(params[:id])
    end

    def content_params
      params.require(:content).permit(:code, :cat, :desc, :context, :section)
    end

    def signed_in_user
      unless signed_in?
        redirect_to signin_url 
        flash[:warning] = "Please sign in." 
      end
    end

    def admin_user
      redirect_to (root_url) unless current_user.admin?
    end
end