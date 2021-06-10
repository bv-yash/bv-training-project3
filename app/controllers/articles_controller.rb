class ArticlesController < ApplicationController
        before_action :set_article, only: %i[ show edit update destroy ]
        before_action :authenticate_user!, except: [ :show, :index ]
        before_action :correct_user!, only: [ :edit, :update, :destroy ]

        # GET /articles or /articles.json
        def index
                @articles = Article.all
        end

        # GET /articles/1 or /articles/1.json
        def show
        end

        # GET /articles/new
        def new
                @article = Article.new
        end

        # GET /articles/1/edit
        def edit
        end

        # POST /articles or /articles.json
        def create
                @article = Article.new(article_params)
                @article.user = current_user
                respond_to do |format|
                        if @article.save
                                format.html { redirect_to @article, notice: "Article was successfully created." }
                                format.json { render :show, status: :created, location: @article }
                        else
                                format.html { render :new, status: :unprocessable_entity }
                                format.json { render json: @article.errors, status: :unprocessable_entity }
                        end
                end
        end

        # PATCH/PUT /articles/1 or /articles/1.json
        def update
                respond_to do |format|
                        if @article.update(article_params)
                                format.html { redirect_to @article, notice: "Article was successfully updated." }
                                format.json { render :show, status: :ok, location: @article }
                        else
                                format.html { render :edit, status: :unprocessable_entity }
                                format.json { render json: @article.errors, status: :unprocessable_entity }
                        end
                end
        end

        # DELETE /articles/1 or /articles/1.json
        def destroy
                @article.destroy
                        respond_to do |format|
                        format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
                        format.json { head :no_content }
                end
        end

        private
        # Use callbacks to share common setup or constraints between actions.
        def set_article
                @article = Article.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def article_params
                params.require(:article).permit(:title, :body)
        end

        def correct_user!
                @article = Article.find_by(id: params[:id])
                if  !current_user.nil? &&  @article.user.id != current_user.id
                        render :file => "#{Rails.root}/public/422.html",  layout: false, status: 422
                end
        end
end
