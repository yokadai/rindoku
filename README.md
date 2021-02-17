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

## rooms　テーブル

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