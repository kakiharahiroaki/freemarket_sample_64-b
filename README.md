
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
- has_many :items
- has_one :address



## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|products|string|null: false|
|description of item|string|null: false|
|price|integer|null: false|
|size|integer|null: false|
|shipping_date|integer|null: false| 
|shipping method|string|null: false|
|postage|integer|null: false| 
|shipping origin|string|null: false|  
|condition|string|null: false|  
|saler_id|integer|null: false, foreign_key: true|
|buyer_id|integer|null: false, foreign_key: true|


### Association
- has_many :images
- belongs_to :category
- belongs_to :brand
- has_many :statues
- belongs_to :user



## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|main|string|null: false|
|ancestry|string||
|item_id|integer|null: false, foreign_key: true|

### Association
- has_many :items



## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|brand|string|null: false|
|item_id|integer|null: false, foreign_key: true|

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
|3-digit PIN|integer|null: false|
|user_id|integer|null: false, foreign_key: true|


### Association
- belongs_to :user

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|postcode|integer|null: false|
|prefecture_id|string|null: false|
|city|string|null: false|
|block|string|null: false|
|building|string||

### Association
- belongs_to :user

