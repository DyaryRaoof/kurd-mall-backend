class ItemVariantsController < ApplicationController
  before_action :set_item_variant, only: %i[show edit update destroy]

  # GET /item_variants or /item_variants.json
  def index
    @item_variants = ItemVariant.all
  end

  # GET /item_variants/1 or /item_variants/1.json
  def show; end

  # GET /item_variants/new
  def new
    @item_variant = ItemVariant.new
  end

  # GET /item_variants/1/edit
  def edit; end

  # POST /item_variants or /item_variants.json
  def create
    @item_variant = ItemVariant.new(item_variant_params)

    respond_to do |format|
      if @item_variant.save
        format.html do
          redirect_to user_store_item_item_variant_url(id: @item_variant),
                      notice: 'Item variant was successfully created.'
        end
        format.json { render :show, status: :created, location: @item_variant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item_variant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_variants/1 or /item_variants/1.json
  def update
    respond_to do |format|
      if @item_variant.update(item_variant_params)
        format.html do
          redirect_to user_store_item_item_variant_url(id: @item_variant),
                      notice: 'Item variant was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @item_variant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item_variant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_variants/1 or /item_variants/1.json
  def destroy
    @item_variant.destroy

    respond_to do |format|
      format.html { redirect_to user_store_item_item_variants_url, notice: 'Item variant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item_variant
    @item_variant = ItemVariant.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def item_variant_params
    params.require(:item_variant).permit(:item_id, :store_id, :name, :value, :price, :cost, :currency, :image_index)
  end
end
