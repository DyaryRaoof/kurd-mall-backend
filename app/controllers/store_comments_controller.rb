class StoreCommentsController < ApplicationController
  before_action :set_store_comment, only: %i[show edit update destroy]

  # GET /store_comments or /store_comments.json
  def index
    @q = StoreComment.ransack(params[:q])
    @store_comments = @q.result(distinct: true).paginate(page: params[:page], per_page: 30)
  end

  # GET /store_comments/1 or /store_comments/1.json
  def show; end

  # GET /store_comments/new
  def new
    @store_comment = StoreComment.new
  end

  # GET /store_comments/1/edit
  def edit; end

  # POST /store_comments or /store_comments.json
  def create
    @store_comment = StoreComment.new(store_comment_params)

    respond_to do |format|
      if @store_comment.save
        format.html do
          redirect_to user_store_store_comment_url(id: @store_comment),
                      notice: 'Store comment was successfully created.'
        end
        format.json { render :show, status: :created, location: @store_comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @store_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /store_comments/1 or /store_comments/1.json
  def update
    respond_to do |format|
      if @store_comment.update(store_comment_params)
        format.html do
          redirect_to user_store_store_comment_url(id: @store_comment),
                      notice: 'Store comment was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @store_comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @store_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /store_comments/1 or /store_comments/1.json
  def destroy
    @store_comment.destroy

    respond_to do |format|
      format.html { redirect_to user_store_store_comments_url, notice: 'Store comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_store_comment
    @store_comment = StoreComment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def store_comment_params
    params.require(:store_comment).permit(:store_id, :user_id, :user_name, :description)
  end
end
