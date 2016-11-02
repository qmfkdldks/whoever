module ArticlesHelper
   def user_like(article)
    if user_signed_in?
      like_list = article.like_list.split(",")
      user_id = current_user.id.to_s
      
      if like_list.include?(user_id)
        @like = "like"
      else
        @like = ""
      end
    end
  end
end
