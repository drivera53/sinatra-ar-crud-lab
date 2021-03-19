
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  ### INDEX ###
  get "/" do
    redirect to "/articles"
  end

  ### CREATE ACTION ###
  # new
  get '/articles/new' do
    @article = Article.new
    erb :new
  end

  # create
  post "/articles" do
    # puts params
    @article = Article.create(params)
    redirect to "/articles/#{ @article.id }"
  end
  

  ### READ ACTION ###
  # index
  get '/articles' do
    @articles = Article.all
    erb :index
  end

  # show
  get "/articles/:id" do
    @article = Article.find(params[:id])
    erb :show
  end

  ### UPDATE ACTION ###
  # edits
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end
  
  # patch/update
  patch "/articles/:id" do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect to "/articles/#{ @article.id }"
  end

  ### DELETE ###
  #destroy
  delete "/articles/:id" do
    Article.destroy(params[:id])
    redirect to "/articles"
  end

end
