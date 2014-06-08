class BillsController < ApplicationController
	# include ApplicationHelper
	def show
		@bill = @commentable = Bill.find(params[:id])
		@comments = @bill.comments
	end

	def create
		@user = current_user
		@bill = @user.created_bills.create!(bill_params)

		if bill_params[:bill_participations]
		@emails = bill_params[:bill_participations][:emails].split(", ")
			
			@emails.each do |email|
				user = User.find_by_email(email)
				BillParticipation.create!(bill_id: @bill.id, user_id: user.id, iou: @bill.cost / (@emails.length + 1))
			end
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
		if request.xhr?
			render :new, :layout => false	
		end
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
		params.require(:bill).permit(:title, :description, :cost,:bill_participations)
	end

	def bill_participation_params
		params.require(:bill_participations).permit(:emails)
	end
end
