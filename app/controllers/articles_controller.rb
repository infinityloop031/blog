class ArticlesController < ApplicationController

    def index 
        # if current_user.role=="admin"
        #     @article=Article.where(user_id:current_user)
        # else
        #     @article=Article.all
        # end
        @article = policy_scope(Article)
        authorize @article
    end

    def new
        authorize Article
        @article=Article.new
    end 

    def edit
        # if current_user.role!="customer"
        #     @article=Article.find(params[:id])
        # else
        #     redirect_to articles_path, notice: "Invalid email or password"
        # end
        authorize Article
        @article=Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        authorize @article
        if @article.update(article_params)
          redirect_to @article
        else
          render 'edit'
        end
    end

    def create
        # if current_user.role!="customer"
        #     @article=current_user.articles.build(article_params)
        #     if @article.save
        #         # @article.article_categories.new(category_id:params[:category_id].require(:id).to_i)

        #         params[:category][:ids].each do |x|
        #             if x!=""
        #                 @article.article_categories.new(category_id:x)
        #             end
        #         end  
        #         @article.save
        #         redirect_to @article
        #     else
        #         render 'new'
        #     end
        # else
        #     redirect_to articles_path, notice: "Invalid email or password"
        # end


        authorize Article   
        @article=current_user.articles.build(article_params)
        if @article.save
            # @article.article_categories.new(category_id:params[:category_id].require(:id).to_i)

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
        @article=Article.find(params[:id])
    end


    def destroy

        # if current_user.role!="customer"
        #     @article = Article.find(params[:id])
        #     @article.destroy
        #     redirect_to articles_path
        # else
        #     redirect_to articles_path, notice: "Invalid email or password"
        # end
        authorize Article
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path

    end

    private

    def article_params
        #params.require(:article).permit(:title,:text)
        params.require(:article).permit(:title, :text, :user_id, :avatar)

    end


end
