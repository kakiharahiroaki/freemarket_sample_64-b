class Item < ApplicationRecord
  has_many_attached :images
  belongs_to :user, optional: true
  
  # accepts_nested_attributes_for :brand
  enum category:  {'選択してください':0,'レディース':1, 'ベビー・キッズ':2,'インテリア・住まい・小物':3,'本音楽・ゲーム':4,'おもちゃ・ホビー・グッズ':5,'コスメ・香水・美容':6,'家電・スマホ・カメラ':7,'スポーツ・レジャー':8,'ハンドメイド':9,'チケット':10,'自転車・オートバイ':11,'その他':12},_suffix: true
  enum shipping_date:  {'選択してください':0,'1~2日で配送':1, '2~3日で配送':2,'4~7日で配送':3},_suffix: true
  enum shipping_method:  {'選択してください':0,'未定':1, 'らくらくメルカリ便':2,'ゆうメール':3, 'レターパック': 4, '普通郵便（定形、定形外）':5, 'クロネコヤマト': 6, 'ゆうパック': 7, 'クリックポスト':8, 'ゆうパケット': 9},_suffix: true
  enum postage:  {'選択してください':0,'送料込み（出品者負担）':1, '着払い（購入者負担）':2},_suffix: true
  enum condition:  {'選択してください':0,'新品/未使用':1, '未使用に近い':2, '目立った傷や汚れなし': 3, 'やや傷や汚れあり':4, 'キズや汚れあり':5, '全体的に状態が悪い':6},_suffix: true
  enum size: {'選択してください':0,'XXS以下':1, 'XS(SS)':2,'S':3, 'M':4, 'L':5, 'XL(LL)':6, '2XL(3L)':7, '3XL(4L)':8, '4XL(5L)以上':9, 'FREESIZE':10, '20cm以下':11, '20.5cm':12, '21cm':13, '21cm':14, '21.5cm':15, '22cm':16, '22.5cm':17, '23cm':18,      '24cm':19, '24.5cm': 20, '25cm':21, '25.5cm': 22, '26cm': 23, '26.5cm': 24, '27cm': 25, '27.5cm以上': 26},_suffix: true
  enum shipping_origin: {'選択してください':0,'北海道':1,'青森県':2 ,'岩手県':3 ,'宮城県':4 ,'秋田県':5 ,'山形県':6 ,'福島県':7 ,'茨城県':8 ,'栃 木県':9 ,'群馬県':10 ,'埼玉県':11 ,'千葉県':12 ,'東京都':13 ,'神奈川県':14 ,'新潟県':15 ,'富山県':16 ,'石川県':17 ,'福井県':18 ,'山梨県':19 ,'長野県':20 ,'岐阜県':21 ,'静岡県':22 ,'愛知県':23 ,'三重県':24 , '滋賀県':25 ,'京都府':26 ,'大阪府':27 ,'兵庫県':28 ,'奈良県':29 ,'和歌山県':30 ,'鳥取県':31 ,'島根県':32 ,'岡山県':33 ,'広島県':34 ,'山口県':35 ,'徳島県':36 ,'香川県':37 ,'愛媛県':38 ,'高知県':39 ,'福岡県':40 ,'佐賀県':41 ,'長崎県':42 ,'熊本県':43 ,'大分県':44 ,'宮崎県':45 ,'鹿児島県':46 ,'沖縄県':47},_suffix: true
  enum status: { '出品中': 0, '出品停止中': 1 }
  
  

  #validation
  validates :products, presence: true, length: { maximum: 40 }
  validates :description_of_item, presence: true, length: { maximum: 1000 }
  validates :price, presence: true, inclusion: 300..9999999
  validates :size, presence: true
  validates :shipping_date, presence: true
  validates :shipping_method, presence: true
  validates :postage, presence: true
  validates :shipping_origin, presence: true
  validates :user_id, presence: true

  
end
