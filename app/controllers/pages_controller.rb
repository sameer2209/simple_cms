class PagesController < ApplicationController

	layout false

	def index
		@pages = Page.all
	end

	def show
		@page = Page.find(params[:id])
	end

	def new
		@page = Page.new
	end

	def create
		@page = Page.new(page_params)
		
		if @page.save
			flash[:notice] = "New Page created successfully"
			redirect_to(:action => 'index')
		else
			render('new')
		end
	end

	def edit
		@page = Page.find(params[:id])
	end

	def update
		@page = Page.find(params[:id])
		if @page.update_attributes(page_params)
			flash[:notice] = "Page updated successfully"
			redirect_to(:action => 'show')
		else
			render('edit')
		end
	end

	def delete
	end

	def destroy
	end

	private

	def page_params
		params.require(:page).permit(:name, :subject_id, :permalink, :position, :visible)
	end

end
