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
		@page = Page.find(params[:id])
	end

	def destroy
		@page = Page.find(params[:id])
		if @page.destroy
			flash[:notice] = "Page '#{@page.name}' destroyed successfully"
			redirect_to('index')
		else
			flash[:notice] = "Error occured"
		end
	end

	private

	def page_params
		params.require(:page).permit(:name, :subject_id, :permalink, :position, :visible)
	end

end
