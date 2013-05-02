# sample-blog-app

Rails勉強用のサンプルアプリ

RailsはRails流に乗っかると効率的、Rails流にのっかるには[Ruby on Rails Guides](http://guides.rubyonrails.org/)を読むのが近道、

今のところ[Getting Started with Rails](http://guides.rubyonrails.org/getting_started.html)を参考に作成した単なるブログに[Action Controller Overview](http://guides.rubyonrails.org/action_controller_overview.html)を参考にユーザ認証をつけた状態。

## 目標

* ログイン
* BDD
* 単純なCRUD
* API DrivenなCRUD
* Pull Request方式での開発

## 始め方

### リポジトリ取得

```bash
$ git clone git@github.com:miss-matching/sample-blog-app.git
```

### gemのインストール

```bash
$ cd sample-blog-app
$ bundle install --path vendor/bundle
```

### DBのマイグレーション

```bash
$ bundle exec rake db:migrate
```

### ユーザの作成

これはユーザ作成の口ができればいらない作業

```bash
$ bundle exec rails console
# usename p-baleine、password aでユーザ作成
> User.create username: 'p-baleine', password: 'a'
```

### 起動

```bash
$ bundle exec rails server
```

http://localhost:3000 で確認

## Tips

### pry-rails

pry-rails入れちゃってます

https://github.com/miss-matching/sample-blog-app/blob/master/Gemfile#L40

`rails console`で起動するのはpryバージョン

```bash
$ bundle exec rails console
[1] pry(main)> 
```

ドキュメントとかソースの参照が楽にできる

```bash
# ActionView::Helpers::FormHelperのメソッドを'form'でgrep
> ls ActionView::Helpers::FormHelper --grep form
ActionView::Helpers::FormHelper#methods: form_for
instance variables: @_dependencies

# ActionView::Helpers::FormHelper#form_forメソッドのドキュメントを参照
> show-doc ActionView::Helpers::FormHelper#form_for 
From: /usr/local/lib/ruby/gems/1.9.1/gems/actionpack-3.2.6/lib/action_view/helpers/form_helper.rb @ line 113:
Owner: ActionView::Helpers::FormHelper
Visibility: public
Signature: form_for(record, options=?, &proc)
Number of lines: 245
Creates a form and a scope around a specific model object that is used
as a base for questioning about values for the fields.
...

# ActionView::Helpers::FormHelper#form_forメソッドのソースを参照
> show-source ActionView::Helpers::FormHelper#form_for
From: /usr/local/lib/ruby/gems/1.9.1/gems/actionpack-3.2.6/lib/action_view/helpers/form_helper.rb @ line 358:
Owner: ActionView::Helpers::FormHelper
Visibility: public
Number of lines: 26
def form_for(record, options = {}, &proc)
... 
```

* [pry](https://github.com/pry/pry)
* [pry-rails](https://github.com/rweng/pry-rails)

### ルーテイングでまよったら

```bash
$ bundle exec rake routes
```

### 本流のリポジトリの変更を自分のリポジトリに適用

```bash
# 以下は最初だけ
# 本流のリポジトリをリモートに追加
$ git remote add miss-matching git@github.com:miss-matching/sample-blog-app.git

# 以降は毎回
# 本流の変更をフェッチ
$ git fetch miss-matching

# 本流にあって自分のリポジトリにないコミットを確認
$ git log --no-merges ^HEAD miss-matching/master
commit bb77b08e041175559be9639db6ecb5af05f7ccb7
Author: Tajima Junpei <p.baleine@gmail.com>
Date:   Thu May 2 08:51:29 2013 +0900

    add `vendor/bundle` to gitignore

# 本流に変更があったのでこれを自分のリポジトリにリベース
$ git rebase miss-matching/master
# 自分のリモートにプッシュ
$ git push origin master
```

## Workflow

以下の作業は最初だけ行う

### miss-matching/sample-blog-appを自分のアカウント用にフォークする

* Github上のリポジトリをブラウザで開く(https://github.com/miss-matching/sample-blog-app)

* 右上の「Fork」クリックして自分のアカウントを選択する、Github上にACCOUNT_NAME/sample-blog-appリポジトリができる

* ローカルにACCOUNT_NAME/sample-blog-appリポジトリをクローンする

```bash
$ git clone git@github.com:p-baleine/sample-blog-app.git
```

以下の作業は毎回行う、以下はissueベースの例

### Pull Request

* 本流に追従している状態でトピックブランチを切る

```bash
$ git checkout -b topic-test-pass origin/master
```

* ソース修正してコミット、プッシュする

```bash
# ソース修正後
$ git add .
# コミット
# コミットメッセージに`closes #<issue number>`を含めるとgithub上のissueを勝手にクローズしてくれる
$ git commit -m "functionalテストを通す, closes #2"
# 自分のリモートのトピックブランチにプッシュ
$ git push origin topic-test-pass
```

* Github上の自分のリポジトリを開く(https://github.com/ACCOUNT_NAME/sample-blog-app)

* 左上のプルダウンメニューから`topic-test-pass`ブランチを選択する

* 「Pull Request」ボタンをクリックして本流のmasterブランチにPull Requestを送る

### マージ

* Github上の本流のリポジトリを開く(https://github.com/miss-matching/sample-blog-app)

* [Pull Requests]をクリックして当該Pull Requestを開く

* みんなからのつっこみを待つ、みんなから`merge it!`をもらえたら[Merge pull request]をクリックする

## TODO

後で[issue](https://github.com/miss-matching/sample-blog-app/issues)にあげる

* パスワードの暗号化
* Userのバリデーション何もしてない
* ログアウト
* User作成の口
* BDD
