#!/bin/bash

# === 定数定義 ===
SRC="/usr/share/locale/ja_JP.UTF-8"
DEST_BASE="$HOME/.config/locale"
DEST="$DEST_BASE/ja_JP.UTF-8"

# === 1. コピー先ディレクトリを作成 ===
mkdir -p "$DEST"

# === 2. 必要なファイルを属性を保持せずにコピー ===
# コピー元ディレクトリを直接コピーして、正しい構造を維持
cp -R "$SRC" "$DEST"

# === 3. LC_TIME を上書き ===
cat > "$DEST/LC_TIME" <<EOF
1
2
3
4
5
6
7
8
9
10
11
12
1月
2月
3月
4月
5月
6月
7月
8月
9月
10月
11月
12月
日
月
火
水
木
金
土
日曜日
月曜日
火曜日
水曜日
木曜日
金曜日
土曜日
%H時%M分%S秒
%Y/%m/%d
%a %b/%e %T %Y
午前
午後
%Y年 %B%e日 %A %X %Z
1月
2月
3月
4月
5月
6月
7月
8月
9月
10月
11月
12月
md
%I:%M:%S %p
EOF

# === 4. zshrc に PATH_LOCALE を追記（重複を避ける）===
if ! grep -q 'export PATH_LOCALE=$HOME/.config/locale' ~/.zshrc; then
  echo 'export PATH_LOCALE=$HOME/.config/locale' >> ~/.zshrc
fi

# === 5. 結果メッセージ ===
echo "✅ ロケール設定が完了しました。"
echo "🌀 反映するには『source ~/.zshrc』を実行するか、ターミナルを再起動してください。"
