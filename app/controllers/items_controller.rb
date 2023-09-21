class ItemsController < ApplicationController
  def index
    @items = Item.order(created_at: :desc)
  end

  def show
    @item = Item.find_by(id: params[:id])
  end

  def new
    @item = Item.new
    @subcategories = Subcategory.all
  end

  def edit
    @item = Item.find_by(id: params[:id])
    @subcategories = Subcategory.all
  end

  def create
    @item = Item.create(item_params)
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
    flash[:success] = t('.success')
    redirect_to(root_path)
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :quantity, :price, :subcategory_id)
  end
end
