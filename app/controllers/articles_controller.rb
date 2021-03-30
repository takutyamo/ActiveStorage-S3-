class ArticlesController < ApplicationController

    def index 
        @articles = Article.all
    end

    def show 
        @article = Article.find(params[:id])
        #通常の変数ではなく、インスタンス変数 (@を冒頭に付けることで示します) が使われている点にもご注目ください。
        #Railsではコントローラのインスタンス変数はすべてビューに渡されるようになっているからです
        # (訳注: Railsはそのために背後でインスタンス変数をコントローラからビューに絶え間なくコピーし続けています)。
    end

    def new 
        @article = Article.new
    end

    def create 
        @article = Article.new(article_params)

        if @article.save #  t || f
            redirect_to @article
            #モデルを保持している@articleを指定するだけで、
            #そのモデルを表示するためのshowアクションにリダイレクトされる点にご注目ください。
        else
            render 'new'
        end
    end

    def edit
        @article = Article.find_by(params[:id]) 
    end

    def update 
        @article = Article.find(params[:id])

        if @article.update(article_params)
          redirect_to @article
        else
          render 'edit'
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path 
    end

    private 
        def article_params 
            params.require(:article).permit(:title, :text)
        end
end
