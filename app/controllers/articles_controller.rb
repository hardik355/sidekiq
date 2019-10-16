class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.create(article_params)
      if @article.save
        SendNotificationJob.perform_now(@article)
          redirect_to article_path(@article)
      else
        render 'new'
      end
  end

  private
  def article_params
    params.require(:article).permit(:name, :description)
  end

end
