class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/cqPX
  # GET /products/cqPX.json
  def show
    @product = Product.where(token: params[:token]).first
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/cqPX/edit
  def edit
    @product = Product.where(token: params[:token]).first
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        redirect_to "/products/#{@product.token}", notice: 'Product was successfully created.'
        # format.html { redirect_to @product, notice: 'Product was successfully created.' }
        # format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/cqPX
  # PATCH/PUT /products/cqPX.json
  def update
    @product = Product.where(id: params[:token]).first
    redirect_to "/products/#{@product.token}", notice: 'Product was successfully created.'
    # respond_to do |format|
    #   if @product.update(product_params)
    #     # format.html { redirect_to @product, notice: 'Product was successfully updated.' }
    #     # format.json { render :show, status: :ok, location: @product }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @product.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /products/cqPX
  # DELETE /products/cqPX.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.where(token: params[:token]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :public_address)
    end
end
