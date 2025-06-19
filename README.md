# iOSDateFix / macOS Terminal Date-Fix Script

macOS のターミナルにおいて `date` や `cal` コマンドの出力が正しく表示されないバグを、一時的に回避するためのスクリプトです。

---

## 🐛 問題の内容

以下のように、`date` コマンドが意味不明な文字列（`#午後`）を返したり、`cal` コマンドで月がずれて表示されることがあります。

Last login: Thu Jun 19 16:14:22 on ttys001
mongachi@MacBook-Air ~ % date #午後
mongachi@MacBook-Air ~ % cal
4 月 2025  
日 月 火 水 木 金 土  
 1 2 3 4 5 6 7  
 8 9 10 11 12 13 14  
15 16 17 18 19 20 21  
22 23 24 25 26 27 28  
29 30

本来ならば `date` は `2025年6月19日（木）〜` のように出力されるべきであり、`cal` も現在の月（6 月）を表示すべきです。

この問題は、環境変数 `LANG` や `LC_TIME` の設定不備や競合によって発生していると推測されます。

---

## 🩹 このスクリプトの目的

このリポジトリに含まれる `fixDate.sh` は、環境変数 `LANG` を `ja_JP.UTF-8` に一時的に設定し、正しい `date` 出力を得るための一時パッチです。

---

## 🚀 使用方法

実行手順：

chmod +x fixDate.sh
./fixDate.sh

実行結果（例）：

2025 年 6 月 19 日 木曜日 16 時 14 分 22 秒 JST

---

## ⚠️ 注意事項

- 恒久的な解決ではありません。
  `.zshrc` などに以下を追記することで、永続的な解決が可能です：

  export LANG=ja_JP.UTF-8

- `ja_JP.UTF-8` が macOS に存在しない場合、システム環境設定の「言語と地域」で日本語を有効にしてください。

---

## 📄 ライセンス

MIT License  
© 2025 mongachi

---

## 🧩 付録：他の考えられる恒久対処方法

- `/etc/locale.conf` の変更（Linux 系）
- `export LC_TIME=ja_JP.UTF-8` の併用
- `launchctl setenv LANG ja_JP.UTF-8` による macOS グローバル設定

---

## 🗃️ ファイル一覧

- `fixDate.sh` - ロケールを一時的に設定し、`date` を正しく出力
