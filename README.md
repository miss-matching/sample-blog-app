# sample-blog-app

Rails勉強用のサンプルアプリ
今のところユーザ認証備えた単なるブログ。
ブログのCRUDらへんをAPI Drivenで書いてみようかな。

## 目標

* ログイン
* BDD
* 単純なCRUD
* API DrivenなCRUD

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

## TODO

後で[issue](https://github.com/miss-matching/sample-blog-app/issues)にあげる

* パスワードの暗号化
* Userのバリデーション何もしてない
* ログアウト
* User作成の口
* BDD
