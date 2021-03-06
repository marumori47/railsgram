class ArticlesController < ApplicationController
	# before_action :set_article, only: [:edit, :update]
	before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

	# 投稿一覧画面
	def index
		@articles = Article.all
	end

	# 新規投稿画面
	def new
		@article = current_user.articles.build
	end

	def create
		@article = current_user.articles.build(article_params)
		if @article.save
			redirect_to root_path
		else
			render :new
		end
	end

	# 編集画面
	def edit
		@article = current_user.articles.find(params[:id])
	end

	def update
		@article = current_user.articles.find(params[:id])
		if @article.update(article_params)
			redirect_to root_path
		else 
			render :edit
		end
	end

	# 削除
	def destroy
		article = current_user.articles.find(params[:id])
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