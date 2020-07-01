# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions


## adress テーブル

| Column           | Type      | Options                        |
| ---------------- | --------- | ------------------------------ |
| user_id          | reference | null: false, foreign_key: true |
| postal_code      | integer   | null: false                    |
| prefecture       | string    | null: false                    |
| city             | string    | null: false                    |
| house_number     | string    | null: false                    |
| room_number      | string    | null: false                    |
| telephone_number | integer   | null: false                    |

### Association

- belongs_to :user

## card テーブル

| Column          | Type      | Options                       |
| --------------- | --------- | ----------------------------- |
| user_id         | reference | null: false, foreign_key:true |
| name            | string    | null: false                   |
| number          | integer   | null: false, unique:true      |
| expiration date | date      | null: false                   |

### Association

- belongs_to :user

## Image テーブル

| Column     | Type      | Options                        |
| ---------- | --------- | ------------------------------ |
| name       | string    | null: false                    |
| Product_id | reference | null: false, foreign_key: true |

### Association-

belongs_to :product

## Category テーブル

| Column     | Type      | Options                        |
| ---------- | --------- | ------------------------------ |
| name       | string    | null: false                    |
| Product_id | reference | null: false, foreign_key: true |

### Association-

belongs_to :product

## User テーブル

| Column           | Type    | Options                  |
| ---------------- | ------- | ------------------------ |
| first name       | string  | null: false              |
| family name      | string  | null: false              |
| first kana       | string  | null: false              |
| family kana      | string  | null: false              |
| nickname         | string  | null: false,unique: true |
| password         | varchar | null: false,unique: true |
| confirm password | varchar | null: false,unique: true |
| mail adress      | varchar | null: false,unique: true |
| birthday         | date    | null: false              |

### Association

- has_many :cards
- belongs_to :adress
- has_many :users_products

## Product テーブル

| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| name               | string    | null: false                    |
| text               | text      | null: false                    |
| price              | integer   | null: false                    |
| condition          | string    | null: false                    |
| shipping area      | string    | null: false                    |
| postage            | string    | null: false                    |
| days               | string    | null: false                    |
| credit information | string    | null: false                    |
| user_id            | reference | null: false, foreign_key: true |
| image_id           | reference | null: false, foreign_key: true |
| category_id        | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :images
- has_many :categorys
- has_many :users_products

