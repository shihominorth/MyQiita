# MyQiita

### 処理概要
QiitaアカウントにOAuthを用いて認証をし、のちに記事の一覧を表示。

1. まず認証済みか確認。認証済みなら自分のこれまでのqiitaの記事一覧が表示され、終了。
1. 認証済みでないのであれば、safari上で認証画面に偏移される
1. 認証後、このMyQiitaに飛ぶかどうかのアラートが出され、戻ってくる
1. 自分のこれまでのqiitaの記事一覧が表示され、終了。

### ビルド前にすること

お手数ですがアプリをビルドする前に以下を行なってください。以下を行なった後、通常通りXcode上で実行を行い確認をお願いします。

#### 環境変数

client_secretを環境変数とし、gitの管理対象から外したため以下を行なってください。

[こちら](https://qiita.com/sskmy1024y/items/30b25ba5ad8d56448ffc)の手順に従って、基本的には環境構築を行なってください。少し古いものなので注意書きを記載します。

- 今回の場合、上記の記事の１は行わなくても大丈夫です。
- 2番のEnvironment.swiftの編集ですが、以下をコピペしていただければ幸いです。下記にも記述がある通り、CLIENT_SECRETの値はエージェントにメールにてお伝えしております。

```
CLIENT_SECRET=メールにてエージェントに値を伝えました
```

- 3番の`import Cocoa`は`import Foundation`に変更をお願いします。
- 4番を行なった後にEnvironment.swiftがXcodeのファイル一覧(Project Navigator)にない場合は、`MyQiita/`直下でFinderを開いていただければ`Environment.swift`が見つかるので、
Project Navigatorにドラッグアンドドロップし、Copy items if neededにチェックを入れてファイルを追加してください。

#### `Pods/`のインストール
- `pod install`をこのプロジェクトルート直下でターミナルで実行をしてください


### その他
- アーキテクチャ
MVP

- こだわりポイント

1. xibファイルを使って再利用可能にした
1. DIを用いて、単体テストがしやすい設計にした
1. 今回はSwiftLintを用いていないが、SwiftLintのルールに則って品質が保たれたコードを目指した。

### 参考URL
https://qiita.com/sskmy1024y/items/30b25ba5ad8d56448ffc
