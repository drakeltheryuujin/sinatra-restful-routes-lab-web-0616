class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #index
  get '/' do
    redirect 'recipes'
  end

  #new recipe form
  get '/recipes/new' do
    erb :new
  end

  #show all recipes
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  #create new recipe
  post '/recipes' do
    @recipe = Recipe.create(params)
    
    redirect "/recipes/#{@recipe.id}"
  end

  #display single recipe
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])

    erb :show
  end

  #edit recipe
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])

    erb :edit
  end

  #updates recipe
  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.update(params)
    # @recipe.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])

    redirect "/recipes/#{@recipe.id}"
  end

  #delete recipe
  delete '/recipes/:id/delete' do
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    erb :delete
  end
end
