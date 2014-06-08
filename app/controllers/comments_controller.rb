class CommentsController < ApplicationController
	# include ApplicationHelper
	def index
	  @commentable = find_commentable
	  @comments = @commentable.comments
	end

	def create
	  @commentable = find_commentable #commentable object
	  @comment = @commentable.comments.new(comment_params)
	  @comment.author = current_user
	  if @comment.save
	    flash[:notice] = "Successfully created comment."
	    redirect_to @commentable
	  else
	    render :action => 'new'
	  end
	end

	def destroy
		@comment = Comment.find_by_id(params[:id])
		@commentable = find_commentable
		@comment.destroy

		redirect_to @commentable 
	end


	private

  def comment_params
    params.require(:comment).permit(:content)
  end

	def find_commentable
	  params.each do |name, value|
	    if name =~ /(.+)_id$/ #chore_id => 3
	      return $1.classify.constantize.find(value) #Chore.find(3)
	    end
	  end
	  nil
	end

end