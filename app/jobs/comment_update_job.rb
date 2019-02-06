class CommentUpdateJob < ApplicationJob
  queue_as :default

  def perform(comment, current_user)
    # Do something later
    ProductChannel.broadcast_to(comment.product_id, comment: render_comment(comment, current_user), average_rating: comment.product.average_rating)
  end

  private

  def render_comment(comment, current_user)
    CommentsController.render(partial: 'comments/comment', locals: { comment: comment, current_user: current_user })
  end

end

# Since we don't have access to current_user directly, we define it as an argument variable and pass it in when we call the job.
