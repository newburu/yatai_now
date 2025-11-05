# app/controllers/manager/stalls_controller.rb

# 1. 継承先を Manager::BaseController に変更
class Manager::StallsController < Manager::BaseController
  # 2. 自分の屋台情報を取得する処理を共通化
  before_action :set_my_stall

  # GET /manager/stall
  def show
    # @my_stall は before_action でセットされる
  end

  # GET /manager/stall/edit
  def edit
    # @my_stall は before_action でセットされる
  end

  # PATCH/PUT /manager/stall
  def update
    if @my_stall.update(stall_params)
      redirect_to manager_stall_path, notice: '屋台情報を更新しました'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_my_stall
    # ★重要: 必ずログイン中のユーザーの屋台情報を取得する
    @my_stall = current_user.stall
  end

  def stall_params
    # 更新を許可するカラムを指定
    params.require(:stall).permit(:name, :description, :status_text)
  end
end