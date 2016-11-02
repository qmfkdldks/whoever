class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index

    #@products = Product.all
    @categories = Category.all
    @products = Product.order(:created_at).page(params[:page])
    
     # some code here
    respond_to do |format|
      format.js
      format.html
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product_detail = @product.product_detail
    @comments = @product_detail.comments
  end

  # GET /products/new
  def new
    @product = Product.new
    @product_detail = @product.build_product_detail
  end

  # GET /products/1/edit
  def edit
  end
  
  # POST /products/filter
  # POST /products/filter.json
  def filter
    
    if(params[:tags] != nil)
      arrays = Array.new
      params[:tags].each do |tag|
        arrays.push TagTable.where(tag_id:tag).map(&:product_id)
      end
      filtered = arrays.inject(:&)  
      puts filtered
      
      @products = Product.find(filtered)
    else
      @products = Product.order(:created_at)
    end
  end
  
  # POST /products/search
  def search
    
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_detail_params)
    #@product_detail = @product.product_details.build(product_detail_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_detail_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
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
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :price, :images, :description)
    end
    
    def product_detail_params
      params.require(:product).permit(:name, :price, :images, :description, product_detail_attributes: [:images, :description])
    end
end
