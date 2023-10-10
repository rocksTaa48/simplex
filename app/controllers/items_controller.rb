class ItemsController < ApplicationController
  # before_action :authenticate_user!, except: %i[show index]
  authorize_resource
  before_action :compare_coatalogue

  def index
    @items = Item.order(created_at: :desc)
  end

  def show
    @item = Item.find_by(id: params[:id])
  end

  def new
    @item = Item.new
    @categories = Category.all
    @subcategories = @category&.subcategories || []
  end

  def edit
    @item = Item.find_by(id: params[:id])
    @subcategories = Subcategory.all
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      flash[:success] = 'Object successfully created'
      redirect_to(root_path)
    else
      flash[:error] = 'Something went wrong'
      render(:new)
    end
  end

  def update
    @item = Item.find_by(id: params[:id])
    if @item.update(item_params)
      redirect_to(root_path)
    else
      render(:edit)
    end
  end

  def destroy
    @item.destroy
    flash[:success] = 'This object destroyed'
    redirect_to(root_path)
  end

  private

  def compare_coatalogue
    @category = Category.find_by(id: params[:category].presence)
    @subcategory = Subcategory.find_by(id: params[:subcategory].presence)
  end

  def item_params
    params.require(:item).permit(:title, :description, :quantity, :price, :subcategory_id, :user_id)
  end
end
