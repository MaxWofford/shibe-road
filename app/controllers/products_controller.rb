class ProductsController < ApplicationController
  inherit_resources

  private

  def product_params
    params.require(:product).permit(:name, :description, :public_address)
  end
end
