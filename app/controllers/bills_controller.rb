class BillsController < ApplicationController
	# include ApplicationHelper
	def show
		@bill = @commentable = Bill.find(params[:id])
		@comments = @bill.comments
	end

	def create
		@bill = Bill.create!(bill_params)
		@emails = bill_participation_params[:emails].split(", ")
		
		@emails.each do |email|
			puts "*" * 1500
			puts email
			user = User.find_by_email(email)
			BillParticipation.create!(bill_id: @bill.id, user_id: user.id, iou: @bill.cost / (@emails.length + 1))
		end
		if @bill.save
			redirect_to @bill
		else
			render "new"
		end
	end

	def new
		@bill = Bill.new
		@user = current_user
	end

	def destroy
		@bill = Bill.find(params[:id])
		@bill.destroy

		redirect_to "/users/#{current_user.id}"
	end

	# def edit
	# 	@bill = Bill.find(params[:id])
		
	# end

	# def update 
	# 	@bill = Bill.find(params[:id])
 #    @bill.update_attributes(bill_params)

	# 	redirect_to bill_path(@bill)
		
	# end

	private
	def bill_params
		params.require(:bill).permit(:title, :description, :creator_id, :cost)
	end

	def bill_participation_params
		params.require(:bill_participation).permit(:emails)
	end
end
