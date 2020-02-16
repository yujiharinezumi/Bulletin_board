# README

# 技術テスト用掲示板アプリ

# 概要
* ユーザが掲示板に文章の投稿ができ、さらに文章にはカテゴリーを複数付与できる。
* ユーザーは単語や文章で投稿を検索することができる

# バージョン情報
* Ruby 2.6.3
* Rails 5.2.4.1

# 機能一覧
- [ ] ユーザー登録機能
- [ ] ログイン機能
- [ ] 文章の投稿機能
- [ ] 投稿に対するコメント機能
- [ ] ワードやカテゴリーを用いた検索機能

# カタログ設計
https://docs.google.com/spreadsheets/d/1Mhn36VhOUSuRNjvGwkQTS-shFwmxaivPIRheb6S8hKE/edit#gid=0
# テーブル設計
https://docs.google.com/spreadsheets/d/1Mhn36VhOUSuRNjvGwkQTS-shFwmxaivPIRheb6S8hKE/edit#gid=1462770733
# ER図
https://docs.google.com/spreadsheets/d/1Mhn36VhOUSuRNjvGwkQTS-shFwmxaivPIRheb6S8hKE/edit#gid=168156034
![ER図](app/assets/images/er.png)
# 画面遷移図
https://docs.google.com/spreadsheets/d/1Mhn36VhOUSuRNjvGwkQTS-shFwmxaivPIRheb6S8hKE/edit#gid=1330771236
![画面繊維図](app/assets/images/screen.png)
# ワイヤーフレーム
https://docs.google.com/spreadsheets/d/1Mhn36VhOUSuRNjvGwkQTS-shFwmxaivPIRheb6S8hKE/edit#gid=828425960
![ワイヤーフレーム図](app/assets/images/wireframe.png)

# 使用gem一覧

## デバッグ
* pry-rails
* better_errors
## テスト
* rspec-rails
* spring-commands-rspec
* factory_bot_rails
* faker
* launchy
* capybara
* webdrivers

# アプリ製作予定
+ 2/13 要件定義完成→目標達成
* 2/14-16 バックエンド実装完成(2/14 ８割完成) →目標達成できそうです
* 2/17  heroku でデプロイ(2/15完成済み),Rspecでテストを完成(2/16 大まかに完成)
* 2/18 -19 デザインを整える(余裕があればメディアクエリでレスポンシブ化)
* 2/20 リファクタリング、インデント整え、仕上げ
