# app/controllers/manager/base_controller.rb

class Manager::BaseController < ApplicationController
  # 1. まずはログイン必須
  before_action :authenticate_user!

  # 2. 次に「屋台管理者(manager)」かどうかをチェック
  before_action :require_manager

  private

  def require_manager
    # Userモデルのenumで定義した `manager?` メソッドを使う
    redirect_to root_path, alert: "権限がありません" unless current_user.manager?
  end
end
