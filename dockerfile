# Node.js のベースイメージを指定
FROM node:16

# 作業ディレクトリを作成
WORKDIR /app

# パッケージ管理ファイルをコピー (例: package.json, package-lock.json)
COPY package*.json ./

# 必要なパッケージをインストール
RUN npm install

# TypeScript をグローバルにインストール
RUN npm install -g typescript

# アプリケーションのソースコードをコンテナにコピー
COPY . .

# TypeScript のソースコードをコンパイル（例: dist フォルダに出力）
RUN tsc

# アプリケーションを実行
CMD ["node", "dist/index.js"]
