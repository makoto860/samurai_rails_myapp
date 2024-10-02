class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "productを新規登録しました"
      redirect_to :products
    else
      flash[:failure] = "productを新規登録に失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @product = Product.find(params[:id])
    @rents = @product.rents
    @rent = @rents.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:success] = "PRODUCT IDが「#{@product.id}」の情報を更新しました"
      redirect_to :products
    else
      render "edit"
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:success] = "productを削除しました"
    redirect_to :products
  end

  private
  def product_params
    params.require(:product).permit(:name, :amount, :address, :image, :user_id).merge(user_id: current_user.id)
  end
end
