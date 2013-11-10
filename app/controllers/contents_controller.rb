class ContentsController < ApplicationController
  before_action :set_content, only: [:show, :edit, :update, :destroy]

  def index
    @contents = Content.all
  end

  def show
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
    redirect_to root_url 
    flash[:success] =  "Exceptions imported."
  end

  private

    def set_content
      @content = Content.find(params[:id])
    end

    def content_params
      params.require(:content).permit(:code, :cat, :desc, :context)
    end
end
