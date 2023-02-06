class ItemsController < ApplicationController
  # ログインしていないユーザーはログインページへ移行する
  before_action :authenticate_user!, except: [:index, :show]

  # 重複箇所
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_root_path, only: [:edit, :destroy]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    
  end

  def edit
    if @item.order.nil?
    else
      redirect_to root_path
    end
  end

  def update
    @item.update(item_params)
    if @item.valid?
      redirect_to item_path(item_params)
    else
      render 'edit'
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end


  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :state_id, :ship_cost_id, :prefecture_id, :ship_date_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_root_path
    if @item.user_id == current_user.id
    else
      redirect_to root_path
    end
  end

end
