class SprintBacklogsController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
    @sprints = @product.sprint_backlogs
    # render text: params
  end
  def show
    @product = Product.find(params[:product_id])
    @sprint_backlog = SprintBacklog.find(params[:id])
  end
  def new
    # render :text => params
    @product = Product.find(params[:product_id])
    @sprint_backlog = SprintBacklog.new
    @user_stories = @product.user_stories.where('sprint_backlog_id IS ?', nil)
    # @user_stories = UserStory.where('sprint_backlog_id IS ?', nil)
  end

  def edit
    @product = Product.find(params[:product_id])
    @sprint_backlog = SprintBacklog.find(params[:id])
    @user_stories =@product.user_stories.where('sprint_backlog_id = ? OR sprint_backlog_id IS ?', @sprint_backlog.id, nil)
    # @user_stories = UserStory.where('sprint_backlog_id = ? OR sprint_backlog_id IS ?', @sprint_backlog.id, nil)
  end
  def create
    # render :text => params
    product = Product.find(params[:product_id])
    sprint_backlog = SprintBacklog.new(sprint_backlog_params)
    sprint_backlog.product = product
    sprint_backlog.save
    create_sprint_backlog_id(sprint_backlog.id)
    redirect_to product_sprint_backlog_path(product, sprint_backlog)
  end

  def update
    # render :text => params
    product = Product.find(params[:product_id])
    sprint_backlog = SprintBacklog.find(params[:id])
    sprint_backlog.update(sprint_backlog_params)
    update_sprint_backlog_id(sprint_backlog.id)
    redirect_to product_sprint_backlog_path(product.id, sprint_backlog.id)
  end

  def destroy
    # render :text => params
    product = Product.find(params[:product_id])
    sprint = SprintBacklog.find(params[:id])
    sprint.destroy
    redirect_to product_sprint_backlogs_path(product.id)
  end
  private
  def sprint_backlog_params
    params.require(:sprint_backlog).permit(:title, :description)
  end

  def update_sprint_backlog_id(sprint_backlog_id)
    UserStory.update_sprint_backlog_id(params, sprint_backlog_id)
  end

  def create_sprint_backlog_id(sprint_backlog_id)
    UserStory.create_sprint_backlog_id(params, sprint_backlog_id)
  end
end
