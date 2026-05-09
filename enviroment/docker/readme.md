# 🗺️ Docker 習得詳細ロードマップ：マイクロサービス構築編

## Phase 1: 導入とエコシステムの理解 (初歩)
*   **インストールと動作確認**
    *   Docker Desktop (Windows/Mac) または Docker Engine (Linux) のセットアップ
    *   `docker run hello-world` で仕組みを体験
*   **Dockerの3要素を理解する**
    *   **Dockerfile**: コンテナの設計図
    *   **Image**: 実行可能なパッケージ（スナップショット）
    *   **Container**: イメージが動き出した実体
*   **基本コマンドの習得**
    *   コンテナのライフサイクル: `run`, `stop`, `start`, `ps`, `rm`
    *   イメージ操作: `images`, `pull`, `rmi`, `build`

## Phase 2: Dockerfile の書き方とイメージ作成 (基礎)
*   **主要な命令のマスター**
    *   `FROM`: ベースイメージの選択 (node, python, alpine等)
    *   `WORKDIR`: 作業ディレクトリの設定
    *   `COPY` vs `ADD`: ファイルのコピー
    *   `RUN`: ビルド時のコマンド実行 (パッケージインストール等)
    *   `CMD` vs `ENTRYPOINT`: コンテナ起動時のデフォルトコマンド
    *   `EXPOSE`: 公開ポートの明示
*   **イメージの最適化**
    *   `.dockerignore` の活用（不要なファイルをビルドに含めない）
    *   レイヤー構造の意識（コマンドをまとめてキャッシュを効かせる）

## Phase 3: コンテナの実行と接続 (中級)
*   **ネットワークとポート**
    *   ポートマッピング (`-p` ホスト:コンテナ)
    *   ブラウザや外部APIクライアント(Postman/Insomnia)からのアクセス確認
*   **データの永続化 (Storage)**
    *   **Bind Mount**: ホストのディレクトリを同期（開発時にコードを変更して即反映）
    *   **Named Volume**: Dockerが管理する領域にデータを保存（DBのデータ保持用）
*   **環境変数の注入**
    *   `-e` オプションや `.env` ファイルによる設定の切り替え

## Phase 4: Docker Compose による複数コンテナ管理 (実践・核心)
*   **docker-compose.yml の記述法**
    *   `services`: API、DB、Cacheなどの定義
    *   `networks`: コンテナ間通信のための仮想ネットワーク
    *   `volumes`: 共通ボリュームの定義
*   **コンテナ間の名前解決**
    *   IPアドレスではなく「サービス名」で通信する仕組み（Docker内部DNS）
*   **依存関係の制御**
    *   `depends_on`: 起動順序の制御（DBが立ち上がってからAPIを起動する等）

## Phase 5: マイクロサービス特有の課題解決 (応用)
*   **マルチステージビルド**
    *   ビルド用と実行用のイメージを分け、本番用イメージを軽量化・安全にする手法
*   **リバースプロキシの導入**
    *   Nginxなどを入り口（API Gateway）として立て、各APIサーバーへ振り分ける構成
*   **ヘルスチェック**
    *   コンテナが正常に動作しているか（APIが応答するか）の監視設定
*   **機密情報の管理**
    *   APIキーやパスワードの安全な取り扱い

## Phase 6: クラウド展開・運用への道 (発展)
*   **Container Registry**
    *   Docker HubやAWS ECRなどへのイメージのプッシュ
*   **CI/CDパイプライン**
    *   GitHub Actionsなどを用いた自動ビルド・テスト
*   **オーケストレーションの概念**
    *   ECS、Fargate、Kubernetesなどの概要理解