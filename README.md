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

| Column              | Type   | Options                  |
| ------------------- | ------ | ------------------------ |
| nickname            | string | null: false              |
| email               | string | null: false, unique:true |
| encrypted_password  | string | null: false              |
| family_name         | string | null: false              |
| personal_name       | string | null: false              |
| family_name_kana    | string | null: false              |
| personal_name_kana  | string | null: false              |
| birth_date          | date   | null: false              |


### Association

- has_many :items
- has_many :purchases

## itemsテーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| product_name           | string     | null: false                    |
| category_id            | integer    | null: false                    |
| price                  | integer    | null: false                    |
| product_introduction   | text       | null: false                    |
| product_condition_id   | integer    | null: false                    |
| shipping_charge_id     | integer    | null: false                    |
| prefecture_id          | integer    | null: false                    |
| days_until_shipping_id | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchasesテーブル
 
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping

## shippingsテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_code      | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| municipality   | string     | null: false                    |
| street_address | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| purchase       | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase
