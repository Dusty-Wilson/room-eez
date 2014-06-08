class EventsController < ApplicationController

	def index
		@events = Event.first(10)
		@event_list = []
		@events.each do |event|
			event.happen_at = Date.parse(event.happen_at)
			@event_list << event
		end
    	@date = params[:month] ? Date.parse("#{params[:month]}-01") : Date.today
	end

	def show
		@event = @commentable = Event.find(params[:id])
		@comments = @event.comments
	end

	def new
		@event = Event.new
	end

	def create
		new_event = current_user.created_events.create(params_event)
		new_event.attendees << current_user
		
		redirect_to current_user
	end

	def participate
		@event = Event.find_by_id(params[:id])
		@event.attendees << current_user

		redirect_to current_user
	end

	def edit
		@event = Event.find_by_id(params[:id])

	end

	def update
		@event = Event.find_by_id(params[:id])
		@event.update_attributes(params_event)

		redirect_to event_path(@event)
	end


	def destroy
		@event = Event.find_by_id(params[:id])
		@event.destroy

		redirect_to current_user
	end


	private

	def params_event
		params.require(:event).permit(:name, :description, :happen_at)
	end

end
