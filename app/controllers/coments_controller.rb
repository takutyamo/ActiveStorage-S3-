class ComentsController < ApplicationController
    def create 
        @article = Article.find(params[:article_id])
        @comment = @article.coments.create(coment_params)
        redirect_to article_path(@article)
    end

    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.coments.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article)
    end

    private 
        def coment_params
            params.require(:coment).permit(:commneter, :body)
        end
end
