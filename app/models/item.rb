class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # テーブルとのアソシエーション
  belongs_to :user
  # has_one    :order

  # アクティブハッシュのアソシエーション
  belongs_to :category
  belongs_to :state
  belongs_to :ship_cost
  belongs_to :prefecture
  belongs_to :ship_date

  # 画像とのアソシエーション
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :category_id
    validates :state_id
    validates :ship_cost_id
    validates :prefecture_id
    validates :ship_date_id
    # 300円以下と9,999,999円以下は表示保存できない
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  # ジャンルの選択が「---」の時は保存できない
  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :prefecture_id
    validates :state_id
    validates :ship_cost_id
    validates :ship_date_id
  end
end
