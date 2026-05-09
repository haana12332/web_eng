### 概要
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
---
### 参考Youtube

1. [Docker超入門Linux](https://www.youtube.com/watch?v=NgpOohgWA_4&t=29s) **(6分からハンズオン)**
    Dockerの操作方法はLinuxコマンドが基盤なため
    1. **Linux基礎知識**
        **シェル：** CLIアプリケーションのこと
        <img src="/asset/image/Linux_relation.png" width="500" alt="説明">
        **ターミナル：** シェルのUI部分（コマンド操作部分）
        コメント：ターミナルはあくまで画面担当、シェルがコマンドを解釈する担当 ＜－ MVCのような役割分担するほうが開発しやすい。

        **CLI操作メリット**
        AI使えーーーーー
    ---
    2. **Linuxコマンド一覧**

        | 分類 | コマンド | 説明 | 使用例 |
        | :--- | :--- | :--- | :--- |
        | **ファイル操作** | `ls` | ディレクトリの内容を表示する | `ls -la` |
        | | `cd` | ディレクトリを移動する | `cd /var/www` |
        | | `pwd` | 現在の作業ディレクトリを表示する | `pwd` |
        | | `cp` | ファイルやディレクトリをコピーする | `cp file.txt backup.txt` |
        | | `mv` | ファイルの移動・名前の変更を行う | `mv old.txt new.txt` |
        | | `rm` | ファイルやディレクトリを削除する | `rm -rf dir_name` |
        | | `mkdir` | 新しいディレクトリを作成する | `mkdir new_folder` |
        | **ファイル閲覧** | `cat` | ファイルの内容を全表示する | `cat file.txt` |
        | | `less` | ファイルの内容を1画面ずつ表示する | `less file.txt` |
        | | `head` / `tail` | ファイルの先頭 / 末尾を表示する | `tail -f access.log` |
        | **権限・実行** | `chmod` | ファイルの権限（パーミッション）を変更 | `chmod 755 script.sh` |
        | | `chown` | ファイルの所有者・グループを変更 | `chown user:group file` |
        | | `sudo` | スーパーユーザーとして実行する | `sudo apt update` |
        | **検索・抽出** | `grep` | 文字列を検索する | `grep "error" log.txt` |
        | | `find` | ファイルを検索する | `find . -name "*.jpg"` |
        | **システム管理** | `top` / `htop` | プロセスの稼働状況を表示する | `top` |
        | | `df` | ディスクの空き容量を確認する | `df -h` |
        | | `ps` | 実行中のプロセスを表示する | `ps aux` |
        | **ネットワーク** | `curl` | URLにリクエストを送信する | `curl -I https://google.com` |
        | | `ssh` | リモートサーバーに接続する | `ssh user@host` |

    ---
2. [Docker超入門 概要理解](https://www.youtube.com/watch?v=oHcLtX_DPko)
    1. **基本の使い方**
        ```
        docker run コンテナ名
        ```
        <img src="/asset/image/docker_image.png" width="500">

        **それぞれの役割**

        |名|**役割**|
        |---|---|
        |**イメージ**|コンテナのひな型|
        |**コンテナとは**|Dockerの実行環境|

    2. **全体の仕組み**
    <img src="/asset/image/docker_flow.png" width="500">
    
        名|**役割**|
        |---|---|
        |**クライアント**|ターミナルで以来を出す場所|
        |**デーモン**|Dockerを起動時にずっと裏で動いている場所|
        |**レジストリ**|クラウド上にあるDockerのひな型の内容を保管している場所|

