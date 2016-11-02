class ArticlesController < ApplicationController
  before_action :require_permission, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @articles = Article.all
  end
  
  def new
    @article = current_user.articles.build
  end
  
  def edit
    @article = get_article
  end
  
  def create
    @article = current_user.articles.build(article_params)
    
    if @article.save
      #render json: params
      redirect_to @article
    else
      render 'new'
    end
  end
  
  def show
    @article = get_article
    num = @article.view_number.next
    @article.update view_number:num
  end
  
  def update
    @articles = get_article
    
    if @articles.update(article_params)
      # render json: params
      redirect_to profile_index_path
    else
      render 'edit'
    end
  end
  
  def like
    puts "Like action requested..."

    @article = get_article
    like_list = @article.like_list.split(",")
    user_id = current_user.id.to_s
    @liked = like_list.include?(user_id)
    if @liked 
      like_list.delete(user_id)
    else
      like_list.push(user_id)
    end
    
    if @article.update(like_list:like_list.join(","), like_number:like_list.count)
      render json: {status: "ok", like_number:@article.like_number, like:!@liked }
    else
      render json: {status: "fail"}
    end
    
  end
  
  def destroy
    @articles = get_article
    @articles.destroy
    
    redirect_to articles_path
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
    
    def get_article
      Article.find(params[:id])
    end
    
    def require_permission
      if current_user != Article.find(params[:id]).user
      puts "Filtered by before_action require_permission...."
      redirect_to articles_path
      else
      puts "passed by before_action require_permission...."
      #Or do something else here
      end
    end
    
end
