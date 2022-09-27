class ArticlesController < ApplicationController

    before_action :find_article, only: [:edit,:update,:show,:destroy]

    def index 
        @article = policy_scope(Article)
        authorize @article
    end

    def new
        authorize Article
        @article=Article.new
    end 

    def edit
        authorize Article
    end

    def update
        authorize @article
        @article.status = params[:status]
        if @article.update(article_params)
          redirect_to @article
        else
          render 'edit'
        end
    end

    def create
        authorize Article   
        @article=current_user.articles.build(article_params)
        if @article.save
            params[:category][:ids].each do |x|
                if x!=""
                    @article.article_categories.new(category_id:x)
                end
            end  
            @article.save
            redirect_to @article
        else
            render 'new'
        end

    end

    def show
    end


    def destroy
        authorize Article
        @article.destroy
        redirect_to articles_path

    end

    private

    def article_params
        params.require(:article).permit(:title, :text, :user_id, :avatar)

    end

    def find_article
        @article = Article.find(params[:id])
    end

end
