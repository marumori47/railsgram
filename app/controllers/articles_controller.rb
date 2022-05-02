class ArticlesController < ApplicationController
	# 投稿一覧画面
	def index
		@articles = Article.all
	end

	# 新規投稿画面
	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_paramas)
		if @article.save
			redirect_to root_path
		else
			render :new
		end
	end

	private
	def article_paramas
		params.require(:article).permit(:content)
	end

end