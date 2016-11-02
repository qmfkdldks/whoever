class CommentsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :require_permission, only: [:update, :destroy]
  
  def create
    #@article = Article.find(params[:article_id])
    #@comment = @article.comments.create(comment_params)
    
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]
    @comment.product_detail_id = params[:product_detail_id]
    @comment.user_id = current_user.id
    @comment.save
    
    
    redirect_to :back
    #puts params
  end
  
  def update
    @comment = get_comments
    @comment.update(comment_params)

    redirect_to profile_index_path 
  end
  
  def destroy
    
    @comments = get_comments
    @comments.destroy

    redirect_to profile_index_path 
  end
  
  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
  
  def get_comments
    Comment.find(params[:id])
  end


  def require_permission
    if current_user != Comment.find(params[:id]).user
      puts "Filtered by before_action require_permission...."
      redirect_to root_path
    else
      puts "passed by before_action require_permission...."
      #Or do something else here
    end
  end
end
