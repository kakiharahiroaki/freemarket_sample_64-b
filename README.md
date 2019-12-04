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

|phone_number|string|null: false|

|is_phone_number_authenticated|string|null: false|

|email|string|null: false|

|password|integer|null: false|

|password_confirmation|integer|null: false|

|postcode|string|null: false|                          郵便番号

|prefecture_id|string|null: false|                     都道府県

|city|string|null: false|                              市区町村

|block|string|null: false|                             番地

|building|string|null: false|                          建物名・部屋番号

|biography|string|null: false|                         自己紹介

|avatar_image_id|string|null: false|                   プロフィール画像


### Association
- has_many :credit_card
- has_many :status
- has_many :items
- has_many :images



## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|products|integer|null: false, foreign_key: true|

|Description of item|integer|null: false, foreign_key: true|          商品説明

|status|integer|null: false, foreign_key: true|                       状態

|size|integer|null: false, foreign_key: true|

|postage|integer|null: false, foreign_key: true|                      送料

|Shipping origin|integer|null: false, foreign_key: true|              発送元

|shipping_date|integer|null: false, foreign_key: true|                発送日

|shipping method|integer|null: false, foreign_key: true|              発送方法

|price|integer|null: false, foreign_key: true|

|saler_id|integer|null: false, foreign_key: true|                     売り者

|buyer_id|integer|null: false, foreign_key: true|                     買い者


### Association
- has_many :images
- has_many :categories,through: :items_categories
- has_many :items_categories
- belongs_to :credit_cards
- belongs_to :user
- belongs_to :statuses




## items_categoriesテーブル             中間
|Column|Type|Options|
|------|----|-------|

|item_id|string|null: false|

|category_id|string|null: false|


### Association
- belongs_to :item
- belongs_to :category




## categoriesテーブル
|Column|Type|Options|
|------|----|-------|

|  |text||

|  |string||

|  |string||

|user_id|integer|null: false, foreign_key: true|

### Association
- has_many :items_categories
- has_many :items,through: :items_categories



## imagesテーブル
|Column|Type|Options|
|------|----|-------|

|products|string|null: false|

|item_id|string|null: false|

|user_id|string|null: false|

### Association
- belongs_to :user
- belongs_to :item




## statusesテーブル
|Column|Type|Options|
|------|----|-------|

|Exhibiting|string||

|During trading|string||

|Sold|string|  |

|item_id|integer|null: false, foreign_key: true|


### Association
- has_many :items
- belongs_to :group



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




