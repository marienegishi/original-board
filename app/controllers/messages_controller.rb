class MessagesController < ApplicationController
before_action :set_message, only: [:edit, :update, :destroy]

  # 表示
  def index
    @board = Board.find(params[:board_id])
    @messages = @board.messages
    @message = Message.new(board: @board)
  end

  # 書き込み
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to :action => :index, board_id: message_params[:board_id]
    else
      # メッセージが保存できなかった時
      @messages = Message.message_list
      flash.now[:alert] = "メッセージの保存に失敗しました。"
      render :index
    end
  end
  
  def edit
  end
  
  def update
    if @message.update(message_params)
      # 保存に成功した場合はトップページへリダイレクト
      redirect_to root_path , notice: 'メッセージを編集しました'
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end

  
  def destroy
    @message.destroy
    redirect_to root_path, notice: 'メッセージを削除しました'
  end

  private
  def message_params
    params.require(:message).permit(:name, :body, :age, :board_id)
  end
  
  def set_message
    @message = Message.find(params[:id])
  end

  ## ここまで
end