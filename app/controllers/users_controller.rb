class UsersController < ApplicationController
  # include ApplicationHelper
	def new
    @errors = params[:errors]
		@user = User.new
	end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(current_user)
    else
      @errors = @user.errors.full_messages
      redirect_to new_user_path(:errors => @errors)
    end
  end

  def calendar
    @chore_list = Chore.first(Chore.all.length)
    @events = Event.all
    @event_list = []
    @events.each do |event|
      event.happen_at = Date.parse(event.happen_at)
      @event_list << event
    end
    @bill_list = Bill.first(Bill.all.length)
    @master_list = @chore_list + @event_list + @bill_list
    @date = params[:month] ? Date.parse("#{params[:month]}-01") : Date.today
  end

  def show

    if current_user
      @user = User.find(params[:id])

      # @bills = @user.bills  
      @bills = Bill.all.order('created_at DESC')
      # @chores = @user.chores
      @chores = Chore.all.order('created_at DESC')
      # @events = @user.events
      @events = Event.all.order('happen_at DESC')
    else 
      redirect_to root_path
    end
  end




  private
    def user_params
      params.require(:user).permit(:first_name,
      	:last_name,
      	:email,
      	:password,
      	:phone_number)
    end
	
end
