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

|postcode|integer|null: false|

|prefecture_id|string|null: false|

|city|string|null: false|

|block|string|null: false|

|building|string||

|biography|string||

|avatar_image_id|string||


### Association
- has_one :credit_card
- has_many :items
- has_many :images



## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|products|string|null: false, foreign_key: true|

|Description of item|string|null: false, foreign_key: true|

|price|integer|null: false, foreign_key: true|

|saler_id|integer|null: false, foreign_key: true|

|buyer_id|integer|null: false, foreign_key: true|


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

|ancestry|string||

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




## statusesテーブル
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

|expiration date|integer|null: false, foreign_key: true|

|3-digit PIN|integer|null: false, foreign_key: true|

|user_id|integer|null: false, foreign_key: true|

|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_one :item




