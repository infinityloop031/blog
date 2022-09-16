
class CommentsController < ApplicationController
    def create
      @article = Article.find(params[:article_id])
      if current_user.role!="admin"
        @comment = @article.comments.create(comment_params)
        redirect_to article_path(@article)
      else
        redirect_to article_path(@article), notice: "Sorry! No didn't have rights to write comment on your own article."
      end
      end
   
    def destroy
      @article = Article.find(params[:article_id])
      @comment = @article.comments.find(params[:id])
      @comment.destroy
      redirect_to article_path(@article)
    end
   
    private
      def comment_params
        params.require(:comment).permit(:commenter, :body)
      end
  end