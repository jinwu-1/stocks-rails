class StocksController < ApplicationController

    def index 
        @stocks = Stock.all
        render json: @stocks
    end

    def show
        @stock = Stock.find(params[:id])
        render json: @stock
    end

    def new
        @stock = Stock.new
    end

    def create
        @stock = Stock.create(stock_params)
        render json: @stock
    end

    def destroy
        @stock = Stock.find(params[:id])
        @stock.destroy
        @stocks = Stock.all
        render json: @stocks
    end

    private

    def stock_params
        params.permit(:symbol, :name, :price, :user_id)
    end

end
