class ProductsController < ApplicationController

  # def item_display
  #   @products = Product.all
  # end

  def index
    @products = Product.all
  end

  def show
    @product = Product.find_by(id: params[:id])

    
    
  end

  def new

  end

  def create
    @product = Product.create({name: params[:name], price: params[:price], image: params[:image], description: params[:description] })

    flash[:success] = "A new product has been created."

    redirect_to "/"
  end

  def edit
    @product = Product.find_by(id: params[:id])
    #above is same as: @recipe = Recipe.find(params[:id])
  end

  def update
    @product = Product.find_by(id: params[:id])

    @product.update({name: params[:name], price: params[:price], image: params[:image], description: params[:description] })

    flash[:success] = "The Product has been updated!!"

    redirect_to "/products/#{@product.id}"
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy

    flash[:success] = "The product was destroyed with a lot of malice."
    flash[:warning] = "The product has been destroyed."
  end

end
