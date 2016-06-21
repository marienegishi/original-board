class BoardsController < ApplicationController
  def show
    @board = Board.new
    @boards = Board.all
  end
  
  # 書き込み
  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to @board
      @boards = Board.all
    else
      # ボードが保存できなかった時
      flash.now[:alert] = "ボードの保存に失敗しました。"
      render :show
    end
  end
  
  private
  def board_params
    params.require(:board).permit(:title)
  end
end
