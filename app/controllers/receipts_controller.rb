class ReceiptsController < ApplicationController
  def new
    @receipt = Receipt.new
  end

  def create
    @receipt = Receipt.new(receipt_params)
    if @receipt.save
      flash[:notice] = "Receipt was successfully created"
      redirect_to new_receipt_path
    else
      render :new
    end
  end

  def index
    @receipts = Receipt.all
  end

  protected
  def receipt_params
    params.require(:receipt).permit(:title, :description, :quantity)
  end

end
