class UserStoriesController < ApplicationController

  def index
    # render :text => params
    @product = Product.find(params[:product_id])
    @user_stories = @product.user_stories
  end
  def show
    @product = Product.find(params[:product_id])
    @user_story = UserStory.find(params[:id])
  end
  def new
    # render :text => params
    @product = Product.find(params[:product_id])
    @user_story = UserStory.new
    5.times {@user_story.acceptances.new}
  end

  def edit
    # render :text => params
    @product = Product.find(params[:product_id])
    @user_story = UserStory.find(params[:id])
    (5 - @user_story.acceptances.count).times {@user_story.acceptances.new}
  end

  def create
    # render :text => params
    product = Product.find(params[:product_id])
    user_story  = UserStory.new(user_story_params)
    user_story.product_id = product.id
    if user_story.save
      flash[:success] = 'Historia de usuario ingresada con exito'
      redirect_to product_user_stories_path
    end
  end

  def update
    # render :text => params
    user_story = UserStory.find(params[:id])
    if user_story.update(user_story_params)
      flash[:success] = 'Historia de usuario actualizada con exito'
      redirect_to product_user_story_path(params[:product_id], params[:id])
    end
  end

  def destroy
    # render :text => params
    user_story = UserStory.find(params[:id])
    if user_story.destroy
      flash[:success] = 'Historia de usuario eliminada con exito'
      redirect_to product_user_stories_path
    end
  end
  private
  def user_story_params
    params.require(:user_story).permit(:title, :content, acceptances_attributes: [:id, :criterion])
  end
end
