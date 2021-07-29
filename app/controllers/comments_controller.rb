class CommentsController < ApplicationController
  #コメント作成する。
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end
  #コメントを削除する。
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end
  #paramsのコメントをハッシュ化
  private
  def comment_params
      params.require(:comment).permit(:commenter, :body)
  end
end
