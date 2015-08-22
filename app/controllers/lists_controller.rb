class ListsController < ApplicationController
  #show all list title to one page [GET]
  def index
    @lists = List.all
  end
  # show list [GET]
  def show
    @list = List.find(params[:id])
  end
  #create a new list
  def new
    @list = List.new
  end
  # Create [POST]
  def create
    @list = List.new(list_params)
    if @list.save
      flash[:success] = "List has been created"
    else
      render 'new'
      flash[:warning] = "Error created"
    end
  end
  # Edit list [GET]
  def edit
    @list = find(params[:id])
  end
  # Update [POST]
  def update
    @list = List.find(params[":id"])
    if @list.update_attributes(list_params)
      # flash whithin name
      flash[:success] = "list name updated"
    else
      render 'edit'
    end
  end

  def destroy
    @list = List.find(params[:id]).destroy
    flash[:success] = "List has been deleted"
    redirect_to lists_path
  end

  private
    def list_params
      params.require(:list).permit(:name)

    end
end
