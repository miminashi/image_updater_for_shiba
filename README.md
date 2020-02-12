# Image updater for Shiba

## 概要

- Shibaでプレビュー中に画像を差し替えても反映されない
- imgタグの挙動からすると仕方ない
- src属性を変化させると画像が更新されるらしい
- 画像の変更を監視してsrc属性にクエリパラメータをつけてやればいい
- Shibaを修正しようと試みたがビルドすら通せなくて断念
- 対象のMarkdownファイルが更新されたとき, 画像のURLにクエリパラメータを付加したURLに書き換えたMarkdownファイルを生成して, それをShibaに読み込ませるという操作をシェルスクリプトでやらせることにした

## 起動

```sh
npm install Shiba  # shiba コマンドのパスが通っていれば他の方法で入れてもよい
brew install fswatch
./watch sample.md
```

## 動作確認

`起動`を行った状態で,

```sh
cp yakisanma.png sanma.png
```

または、

```sh
cp namasanma.png sanma.png
```

とすると、サンマの画像が差し替わる。

## ライセンス

Public Domain

ただし、以下のファイルを除く。

- namasanma.png
- sanma.png
- yakisanma.png

これら3つのファイルは[いらすとや](https://www.irasutoya.com/)の利用規約に従い再配布しているものであり, 当レポジトリの所有者の著作物ではありません。
