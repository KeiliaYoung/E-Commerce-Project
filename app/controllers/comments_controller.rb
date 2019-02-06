class CommentsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)
    @comment.user = current_user
    @user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @product, notice: 'Review was created successfully.' }
        format.json { render :show, status: :created, location: @product }
        format.js
      else
        format.html { redirect_to @product, alert: 'Review was not saved successfully.' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    product = @comment.product
    @comment.destroy
    redirect_to product
  end

  private

    def comment_params
      params.require(:comment).permit(:user_id, :body, :rating)
    end
end


# ActionCable.server.broadcast 'product_channel', comment: @comment, average_rating: @comment.product.average_rating
# The broadcast_to method has to be called on a channel class.
# It expects at least two arguments. The first argument is the specific model you want to broadcast to.
# The following argument contains the actual data you're broadcasting.
# Since we use the product_id for the channel instead of the actual product object we broadcast to @product.id and not just @product.
