
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
|nmb_birthday|integer|null: false|
|phone_number|integer|unique: true,null: false|
|is_phone_number_authenticated|integer|null: false|
|email|string|unique: true,null: false|
|password|integer|unique: true,null: false|
|password_confirmation|integer|null: false|
|biography|string||
|avatar_image_id|string||


### Association
- has_one :credit_card
- has_many :items, dependent: :destroy
- has_one :address



## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|products|string|null: false|
|description_of_item|string|null: false|
|price|integer|null: false|
|size|integer|null: false|
|shipping_date|integer|null: false| 
|shipping_method|string|null: false|
|postage|integer|null: false| 
|shipping_origin|string|null: false|  
|condition|string|null: false|
|brand_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
|saler_id|integer|null: false, foreign_key: true|
|buyer_id|integer|null: false, foreign_key: true|


### Association
- has_many :images, dependent: :destroy
- belongs_to :category
- belongs_to :brand
- has_many :statues, dependent: :destroy
- belongs_to :user



## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|main|string|null: false|
|ancestry|string||


### Association
- has_many :items



## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items



## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item


## statusesテーブル
|Column|Type|Options|
|------|----|-------|
|status|integer|null: false|  
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item


## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|number|integer|null: false|
|expiration date|integer|null: false|
|3_digit_PIN|integer|null: false|
|user_id|integer|null: false, foreign_key: true|


### Association
- belongs_to :user

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|postcode|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|block|string|null: false|
|building|string||
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user

