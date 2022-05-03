class ArticlesController < ApplicationController
	before_action :set_article, only: [:edit, :update]

	# 投稿一覧画面
	def index
		@articles = Article.all
	end

	# 新規投稿画面
	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		if @article.save
			redirect_to root_path
		else
			render :new
		end
	end

	# 編集画面
	def edit
	end

	def update
		if @article.update(article_params)
			redirect_to root_path
		else 
			render :edit
		end
	end

	# 削除
	def destroy
		article = Article.find(params[:id])
		article.destroy!
		redirect_to root_path
	end

	private
	def article_params
		params.require(:article).permit(:content)
	end

	def set_article
		@article = Article.find(params[:id])
	end

end