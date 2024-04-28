# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## usersテーブル

| Column     | Type   | Options                  |
| ---------- | ------ | ------------------------ |
| nickname   | string | null: false              |
| email      | string | null: false, unique:true |
| password   | string | null: false              |
| name       | string | null: false              |
| name_kana  | string | null: false              |
| birth_date | string | null: false              |


### Association

- has_many :items
- has_many :purchases

## itemsテーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| product_name         | string     | null: false                    |
| category             | string     | null: false                    |
| price                | string     | null: false                    |
| seller               | string     | null: false                    |
| product_introduction | string     | null: false                    |
| product_condition    | string     | null: false                    |
| shipping_charges     | string     | null: false                    |
| region_of_origin     | string     | null: false                    |
| days_until_shipping  | string     | null: false                    |
| user_id              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchases

## purchasesテーブル
 
| Column  | Type       | Options                        |
| --------| ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shippings

## shippingsテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_code      | string     | null: false                    |
| prefectures    | string     | null: false                    |
| municipality   | string     | null: false                    |
| street_address | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| purchase_id    | references | null: false, foreign_key: true |

### Association

- belongs_to :purchases
