class Product < ActiveRecord::Base
  has_many :orders, :through => :line_items, :dependent => :destroy, :order => 'id DESC'
  has_many :line_items, :dependent => :destroy
  has_many :sell_prices, :dependent => :destroy
  has_many :buy_prices, :dependent => :destroy
  has_one :active_sell_price, :class_name => "SellPrice"
  has_one :active_buy_price, :class_name => "BuyPrice"
  has_attached_file :image, :styles => { :medium => "100x100>", :thumb => "64x64>" }
  
  validates_presence_of :title, :description, :active_sell_price, :active_buy_price
  validates_uniqueness_of :title
  validates_numericality_of :stock
  validate :stock_must_be_positive

  scope :for_sale, :conditions => ["stock > 0"], :order => :title
  scope :starting_with, lambda{|letter|{:conditions => ["title LIKE ?", "#{letter}%"]}}
  default_scope :order => 'title ASC'

  accepts_nested_attributes_for :active_sell_price, :allow_destroy => false
  accepts_nested_attributes_for :active_buy_price, :allow_destroy => false

  protected

  def stock_must_be_positive
    errors.add(:stock, 'should be positive or cero' ) if stock.nil? ||
      stock < 0
  end

  # def image=(file)
    # image = ProductImage.new(:uploaded_data => file)
    # image.save
    # self.product_image = image
  # end

  def reduce_stock(amount)
    self.stock = self.stock - amount
  end

  def increase_stock(amount)
    self.stock = self.stock + amount
  end

end
