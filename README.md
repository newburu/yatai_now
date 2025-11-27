# 屋台位置共有アプリ

これは、祭りの屋台のリアルタイムな位置情報を共有するためのRuby on Railsアプリケーションです。

## 機能

- **リアルタイムマップ表示:** 訪問者は、地図上で全ての屋台の現在位置を閲覧できます。
- **GPS送信:** 指定されたユーザーは、自分の屋台のGPS位置情報を送信できます。
- **屋台管理:** 屋台の管理者は、自分の屋台の情報を更新できます。
- **管理者ダッシュボード:** 管理者は、祭り、屋台、およびユーザーアカウントを管理できます。

## 技術スタック

- **バックエンド:** Ruby on Rails
- **データベース:** PostgreSQL
- **フロントエンド:** Hotwire (Turbo, Stimulus), Importmap
- **認証:** Devise
- **認可:** Pundit
- **デプロイ:** Kamal

## 開発環境のセットアップ

### 前提条件

- Ruby (`.ruby-version` ファイルで指定されているバージョン)
- PostgreSQL

### インストール

1.  **リポジトリをクローンする:**
    ```bash
    git clone <repository-url>
    cd <repository-directory>
    ```

2.  **Rubyの依存関係をインストールする:**
    ```bash
    bundle install
    ```

3.  **データベースを作成・設定する:**
    - PostgreSQLのユーザーとデータベースを作成します。
    - `.env.example` を `.env` にコピーし、データベースの認証情報を入力します:
      ```bash
      cp .env.example .env
      ```

4.  **データベースをセットアップする:**
    ```bash
    bundle exec rails db:create
    bundle exec rails db:migrate
    bundle exec rails db:seed_fu
    ```

### アプリケーションの実行

- **Railsサーバーを起動する:**
  ```bash
  bundle exec rails server
  ```

- **テストスイートを実行する:**
  ```bash
  bundle exec rails test
  ```

## デプロイ

このアプリケーションは、[Kamal](https://kamal-deploy.org/) を使用したデプロイが設定されています。デプロイの手順については、Kamalの公式ドキュメントを参照してください。
