class DeliverysController < ApplicationController
  
  def index
    @purchase_delivery = PurchaseDelivery.new
  end