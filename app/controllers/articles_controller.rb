class ArticlesController < ApplicationController

    def index 
        @article = Article.all
    end

    def new
        if current_user.role!="customer"
            @article=Article.new
        else
            redirect_to articles_path, notice: "Invalid email or password"
        end
    end 

    def edit
        if current_user.role!="customer"
            @article=Article.find(params[:id])
        else
            redirect_to articles_path, notice: "Invalid email or password"
        end
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
          redirect_to @article
        else
          render 'edit'
        end
    end

    def create
        if current_user.role!="customer"
            @article=Article.new(article_params)
            @article.avatar.attach(article_params[:avatar])
            @article.user_id=current_user.id
            if @article.save
                redirect_to @article
            else
                render 'new'
            end
        else
            redirect_to articles_path, notice: "Invalid email or password"
        end
    end

    def show
        @article=Article.find(params[:id])
    end


    def destroy
        if current_user.role!="customer"
            @article = Article.find(params[:id])
            @article.destroy
            redirect_to articles_path
        else
            redirect_to articles_path, notice: "Invalid email or password"
        end
    end

    private

    def article_params
        #params.require(:article).permit(:title,:text)
        params.require(:article).permit(:title, :text, :avatar,:user_id)
    end


end
