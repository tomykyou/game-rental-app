class ArticlesController < ApplicationController
  before_action :logged_in_user, only:[:edit, :update, :destroy]
  #データベースのレコードを全て取り出す。
  def index
    @articles = Article.all
    @user=User.find(1)
  end
  #データベースのレコードからページIDと一致する１件を取り出す。
  def show
    @article = Article.find(params[:id])
  end
  #新しい商品を1件インスタンスする。
  def new
    @article = Article.new
  end
  #新しい商品をインスタンス化し、データベースに保存する。
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end
  #データベースから商品を取得し、インスタンス化する。
  def edit
    @article = Article.find(params[:id])
  end
  #アクションはデータベースから商品を（再）取得し、送信済みのフォームデータを更新する。
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end
  #データベースから商品を取得してdestroyメソッドを呼び出しています。
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
  #paramsハッシュに保存
  def article_params
    params.require(:article).permit(:product_name, :product_price, :product_company, :product_text, :image, :platform)
  end

end