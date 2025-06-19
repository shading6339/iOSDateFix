# iOSDateFix / macOS Terminal Locale Patch Script

macOS のターミナルで `date` や `cal` コマンドが正しく表示されない問題を一時的に回避するためのスクリプトです。

---

## 🐛 問題の内容

以下のように、`date` コマンドが `#午後` のような意味不明な出力になったり、`cal` コマンドで月がずれて表示されることがあります。

例：

Last login: Thu Jun 19 16:14:22 on ttys001
mongachi@MacBook-Air ~ % date
#午後
mongachi@MacBook-Air ~ % cal
      4月 2025         
日 月 火 水 木 金 土  
 1  2  3  4  5  6  7  
 8  9 10 11 12 13 14  
15 16 17 18 19 20 21  
22 23 24 25 26 27 28  
29 30                 

本来表示されるべきは現在の月（6月）や、正しい日付フォーマットです。

---

## 🔧 スクリプトの内容

このスクリプトは以下の処理を行います：

1. `/usr/share/locale/ja_JP.UTF-8` を `$HOME/.config/locale` にコピー
2. `LC_TIME` を独自内容で上書き
3. `.zshrc` に `PATH_LOCALE` を追記
4. 必要に応じて `LOCPATH` と `LANG` の環境変数も `.zshrc` に追加

---

## ✅ 恒久化のための追加設定

このスクリプトはロケール定義をホームディレクトリに複製するだけでなく、以下の環境変数を `.zshrc` に設定することで **恒久的な変更を実現**します：

```bash
export PATH_LOCALE=$HOME/.config/locale
export LOCPATH=$PATH_LOCALE
export LANG=ja_JP.UTF-8
```

この設定により、macOS のターミナルが日本語ロケール定義を優先的に使用するようになります。

---

## 🚀 使用手順

1. スクリプトに実行権限を付与：

   chmod +x fixDate.sh

2. 実行：

   ./fixDate.sh

3. 反映：

   source ~/.zshrc  または ターミナル再起動

---

## 📄 ライセンス

MIT License  
© 2025 mongachi

---

## 📌 注意事項

- このスクリプトはユーザーレベルでの修正です。システム全体のロケール設定には影響を与えません。
- macOS のアップデートによって再設定が必要になる可能性があります。

---

