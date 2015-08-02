class ProductsController < ApplicationController
  def index
    @products = current_user.products
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.create(product_params.merge(user: current_user))
    params[:product][:files].each do |file|
      Picture.create(picture: file, imageable: product)
    end
    redirect_to products_path
  end

  def edit
    product
  end

  def update
    Product.update_attributes(product_params.merge(user: current_user))
    params[:product][:files].each do |file|
      Picture.create(picture: file, imageable: product)
    end
    redirect_to products_path
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to offers_url, notice: 'Producto eliminado' }
      format.json { head :no_content }
    end
  end

  private

  def product
    @product ||= Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:description, :user_id)
  end
end