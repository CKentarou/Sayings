# Sayings - Rails アプリケーション

このアプリケーションは、Docker Composeを使用してRails 7.1.5とMySQL 8.3で構築されています。

## 必要な環境

- Docker
- Docker Compose

## 環境構築手順

### 1. リポジトリのクローン

```bash
git clone <repository-url>
cd Sayings
```

### 2. Docker Composeでアプリケーションを起動

```bash
docker-compose up --build
```

初回実行時は、DockerイメージのビルドとGemのインストールが行われるため、時間がかかります。

### 3. データベースのセットアップ

アプリケーションが起動したら、別のターミナルで以下のコマンドを実行してデータベースをセットアップします：

```bash
# データベースの作成
docker-compose exec web rails db:create

# マイグレーションの実行
docker-compose exec web rails db:migrate

# シードデータの投入（必要な場合）
docker-compose exec web rails db:seed
```

### 4. アプリケーションへのアクセス

アプリケーションは以下のURLでアクセスできます：
- Webアプリケーション: http://localhost:3000
- MySQLデータベース: localhost:3307

## 開発用コマンド

### アプリケーションの停止
```bash
docker-compose down
```

### ログの確認
```bash
docker-compose logs -f web
```

### Railsコンソールへのアクセス
```bash
docker-compose exec web rails console
```

### テストの実行
```bash
docker-compose exec web rails test
```

### 新しいGemの追加
Gemfileを編集した後、以下のコマンドでGemをインストール：
```bash
docker-compose exec web bundle install
```

### データベースのリセット
```bash
docker-compose exec web rails db:drop db:create db:migrate db:seed
```

## 技術スタック

- **Ruby**: 3.3.9
- **Rails**: 7.1.5
- **データベース**: MySQL 8.3
- **Webサーバー**: Puma
- **アセットパイプライン**: Sprockets
- **JavaScript**: Importmap + Stimulus + Turbo

## トラブルシューティング

### ポートが既に使用されている場合
`compose.yml`のポート設定を変更してください：
```yaml
ports:
  - '3001:3000'  # 3000の代わりに3001を使用
```

### データベース接続エラー
データベースコンテナが完全に起動するまで少し時間がかかることがあります。数分待ってから再度試してください。

### 権限エラー
Dockerの権限設定を確認してください：
```bash
sudo usermod -aG docker $USER
```

## 開発のヒント

- コードの変更は即座に反映されます（ホットリロード）
- `db_data`ディレクトリにはMySQLのデータが永続化されます
- 開発環境では`web-console`が利用可能です
