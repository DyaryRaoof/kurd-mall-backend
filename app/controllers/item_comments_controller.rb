class ItemCommentsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show item_detail_comments]
  before_action :set_item_comment, only: %i[show edit update destroy]

  # GET /item_comments or /item_comments.json
  def index
    @q = ItemComment.where(item_id: params[:item_id]).ransack(params[:q])
    @item_comments = @q.result(distinct: true).paginate(page: params[:page], per_page: 30)
  end

  def item_detail_comments
    @item_comments = ItemComment.where(item_id: params[:item_id]).paginate(page: params[:page], per_page: 30)
    render json: @item_comments, status: :ok
  end

  # GET /item_comments/1 or /item_comments/1.json
  def show; end

  # GET /item_comments/new
  def new
    @item_comment = ItemComment.new
  end

  # GET /item_comments/1/edit
  def edit; end

  # POST /item_comments or /item_comments.json
  def create
    @item_comment = ItemComment.new(item_comment_params)

    respond_to do |format|
      if @item_comment.save
        format.html do
          redirect_to user_store_item_item_comment_url(id: @item_comment),
                      notice: 'Item comment was successfully created.'
        end
        format.json { render json: @item_comment, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_comments/1 or /item_comments/1.json
  def update
    respond_to do |format|
      if @item_comment.update(item_comment_params)
        format.html do
          redirect_to user_store_item_item_comment_url(id: @item_comment),
                      notice: 'Item comment was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @item_comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_comments/1 or /item_comments/1.json
  def destroy
    @item_comment.destroy

    respond_to do |format|
      format.html { redirect_to user_store_item_item_comments_url, notice: 'Item comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item_comment
    @item_comment = ItemComment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def item_comment_params
    params.require(:item_comment).permit(:item_id, :user_id, :user_name, :description, :user_image)
  end
end
