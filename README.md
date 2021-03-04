# テーブル設計

## users テーブル

| column             | Type       | options                   |
| ------------------ | ---------- | ------------------------- |
| name               | string     | null: false               |
| email              | string     | null: false, unique: true |
| encrypted_password | string     | null: false               |

### Association

- has_many :rooms, through: :user_rooms
- has_many :user_rooms
- has_many :messages

## rooms テーブル

| column                  | Type       | options                        |
| ----------------------- | ---------- | ------------------------------ |
| room_name               | string     | null: false                    |
| user                    | reference  | null: false, foreign_key: true |

### Association

- has_many :user_rooms
- has_many :users, through: :user_rooms
- has_many :messages

## user_rooms テーブル

 column                   | Type       | options                        |
| ----------------------- | ---------- | ------------------------------ |
| room                    | reference  | null: false, foreign_key: true |
| user                    | reference  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room

## Messages テーブル

 column                   | Type       | options                        |
| ----------------------- | ---------- | ------------------------------ |
| room                    | reference  | null: false, foreign_key: true |
| user                    | reference  | null: false, foreign_key: true |
| message                 | text       | null: false                    |

### Association

- belongs_to :user
- belongs_to :room

# アプリケーション説明

## アプリケーション名
- rindoku

## アプリケーション概要
- アカウントを作成し、グループを作成することで複数人でチャットができます。
この機能を用いて、任意のユーザーと輪読を行うことができます。

## URL
- 後日デプロイ予定

## テスト用アカウント
- email: test@sample
- pass:  aaaaa1

## 利用方法
- ログイン後、左上の「新規グループを作成する」からグループを作成します。
グループ作成後、任意のルーム名をクリックし、メッセージ投稿画面を開きます。
画面下部のフォームにメッセージを記述し、送信することでメッセージが投稿されます。以下に参考動画を添付してあります。

***DEMO:***

![Demo]https://gyazo.com/256619d0db28254ccd206c12851b8caa
![Demo]https://gyazo.com/60dabc70c6655c66abdd58c2267ed293
![Demo]https://gyazo.com/d3714307af9afa3c17658d2f1d912f90

## 目指した課題解決
- 本の知識をより速く、そして深く身につけたいと考えている人々に向けてこのアプリケーションを作りました。
「輪読」を行うことで上記の課題は解決できます。しかし、必ずしも周囲に輪読をできる友人がいるとは限りません。
加えて、オンライン上での輪読会は申込み等が必要で、手軽に参加できるとは言い難いです。そこで、手軽に使用できる輪読用のアプリケーションを開発しました。
このアプリケーションを使うことで、読書で得た知識・知見がより効率的に身につきます。

## 実装済機能
- ユーザー管理機能
- グループ管理機能
- メッセージ投稿機能

## 実装予定機能
- ユーザー情報編集機能
- メッセージ編集機能
- 本タイトル検索機能

## ローカルでの動作方法
- git clone https://github.com/yokadai/rindoku.git
- bundle install
- rails db:create
- rails db:migrate
- rails s

## 開発環境
- Ruby/Ruby on Rails/Github/MySQL/Visual Studio Code 