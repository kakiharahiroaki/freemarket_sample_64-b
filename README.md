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
|Column|Type|Options|
|------|----|-------|
|last_name|string|null: false|

|first_name|string|null: false|

|last_name_kana|string|null: false|

|first_name_kana|string|null: false|

|nmb_birthday|integer|null: false|                    生年月日

|phone_number|integer|unique: true,null: false|

|is_phone_number_authenticated|integer|null: false|

|email|string|unique: true,null: false|

|password|integer|unique: true,null: false|

|password_confirmation|integer|null: false|

|postcode|integer|null: false|                          郵便番号

|prefecture_id|string|null: false|                     都道府県

|city|string|null: false|                              市区町村

|block|string|null: false|                             番地

|building|string||                          建物名・部屋番号

|biography|string||                         自己紹介

|avatar_image_id|string||                   プロフィール画像


### Association
- has_one :credit_card
- has_many :items
- has_many :images



## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|products|string|null: false, foreign_key: true|

|Description of item|string|null: false, foreign_key: true|          商品説明

|price|integer|null: false, foreign_key: true|

|saler_id|integer|null: false, foreign_key: true|                     売り者

|buyer_id|integer|null: false, foreign_key: true|                     買い者


### Association
- has_many :images
- has_many :categories
- has_many :brands
- has_many :sizes
- has_many :shipping_dates
- has_many :shipping methods
- has_many :postages
- has_many :statues
- has_many :shipping origins

- belongs_to :credit_card
- belongs_to :user



## categoriesテーブル
|Column|Type|Options|
|------|----|-------|

|main|string|null: false|

|sub|string||

|sub_right|string||

|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item



## brandsテーブル
|Column|Type|Options|
|------|----|-------|

|brand|string|null: false|

|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item



## imagesテーブル
|Column|Type|Options|
|------|----|-------|

|product|string|null: false|

|item_id|integer|null: false, foreign_key: true|

|user_id|integer|null: false, foreign_key: true|

- belongs_to :user
- belongs_to :item





## sizesテーブル
|Column|Type|Options|
|------|----|-------|

|size|integer|null: false, foreign_key: true|

|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item



## shipping_datesテーブル
|Column|Type|Options|
|------|----|-------|


|shipping_date|integer|null: false, foreign_key: true| 


|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item




## shipping methodsテーブル
|Column|Type|Options|
|------|----|-------|


|shipping method|string|null: false, foreign_key: true|

|item_id|integer|null: false|


### Association
- belongs_to :item



## postagesテーブル
|Column|Type|Options|
|------|----|-------|

|postage|integer|null: false, foreign_key: true| 

|item_id|integer|null: false|


### Association
- belongs_to :item




## statuesテーブル
|Column|Type|Options|
|------|----|-------|

|status|string|null: false, foreign_key: true|  

|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item



## Shipping originsテーブル
|Column|Type|Options|
|------|----|-------|

|Shipping origin|string|null: false, foreign_key: true|  

|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item


## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|

|number|integer|null: false, foreign_key: true|

|expiration date|integer|null: false, foreign_key: true|       有効期限

|3-digit PIN|integer|null: false, foreign_key: true|           3桁の暗証番号

|user_id|integer|null: false, foreign_key: true|

|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_one :item




