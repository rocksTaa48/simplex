class SubcategoriesController < ApplicationController
  def index
    @subcategories = Subcategory.order(created_at: :desc)
  end

  def show
    @subcategory = Subcategory.find_by(id: params[:id])
  end

  def new
    @subcategory = Subcategory.new
  end

  def create
    @subcategory = Subcategory.create(subcategory_params)
    if @subcategory.save
      flash[:success] = 'Object successfully created'
      redirect_to(root_path)
    else
      flash[:error] = 'Something went wrong'
      render(:new)
    end
  end

  def update
    @subcategory = Subcategory.find_by(id: params[:id])
    if @subcategory.update(subcategory_params)
      redirect_to(root_path)
    else
      render(:edit)
    end
  end

  def destroy
    @subcategory.destroy
    flash[:success] = t('.success')
    redirect_to(root_path)
  end

  private

  def subcategory_params
    params.require(:subcategory).permit(:title, :body)
  end
end
