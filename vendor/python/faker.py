import pandas as pd
from faker import Faker

fake = Faker('ja_JP')

fake.seed(42)

# １５人の顧客
customers = []
for i in range(15):
  customers.append([
      i + 1,
      fake.name(),
      fake.email(),
  ])

df = pd.DataFrame(customers, columns=['id', 'name', 'email'])
display(df.head(5))

df.to_csv('sample_csv/customers.csv', index=False)

# 20個配送先
addresses = []
for i in range(20):
  addresses.append([
      i + 1,
      fake.random_int(min=1, max=len(customers)),  # 顧客ID
      fake.phone_number(),
      fake.random_int(min=1, max=47),  # 都道府県ID
      fake.city(),
  ])

df = pd.DataFrame(addresses, columns=[
                  'id', 'customer_id', 'phone', 'prefecture_id', 'city'])
display(df.head(5))
df.to_csv('sample_csv/addresses.csv', index=False)

# 9個商品
item_names = ['りんご', 'みかん', 'トマト', 'バナナ', 'いちご', 'ピーナツ', 'クルミ', '甘栗', '柿の種']
items = []
for i in range(len(item_names)):
  items.append([
      i + 1,
      item_names[i],
      fake.random_int(min=30, max=500),  # 価格
  ])

df = pd.DataFrame(items, columns=['id', 'name', 'price'])
display(df.head(5))
df.to_csv('sample_csv/items.csv', index=False)

# 30個レビュー
reviews = []
for i in range(30):
  time_stamp = fake.iso8601(tzinfo=None, end_datetime=None)  # 作成時刻
  reviews.append([
      i + 1,
      fake.random_int(min=1, max=len(items)),  # 商品ID
      fake.random_int(min=1, max=len(customers)),  # 顧客ID
      fake.random_int(min=1, max=5),  # 評価点数
      fake.paragraph(nb_sentences=3),  # レビュー本文
      time_stamp,
      time_stamp,
  ])

df = pd.DataFrame(reviews, columns=[
                  'id', 'item_id', 'customer_id', 'score', 'text', 'created_at', 'updated_at'])
display(df.head(5))
df.to_csv('sample_csv/reviews.csv', index=False)

# 50個購入記録
purchases = []
for i in range(50):
  time_stamp = fake.iso8601(tzinfo=None, end_datetime=None)  # 作成時刻
  purchases.append([
      i + 1,
      fake.random_int(min=1, max=len(items)),  # 商品ID
      # 配送先ID、顧客IDはRailsにインポート時割り出す
      fake.random_int(min=1, max=len(addresses)),
      fake.random_int(min=1, max=10),  # 個数
      time_stamp,
      time_stamp,
  ])

df = pd.DataFrame(purchases, columns=[
                  'id', 'item_id', 'address_id', 'number', 'created_at', 'updated_at'])
display(df.head(5))
df.to_csv('sample_csv/purchases.csv', index=False)

# 3個Tag
tag_names = ['セールス中', 'オススメ', '国内産']
tags = []
for i in range(len(tag_names)):
  tags.append([
      i + 1,
      tag_names[i],
  ])

df = pd.DataFrame(tags, columns=['id', 'name'])
display(df.head(3))
df.to_csv('sample_csv/tags.csv', index=False)


# tag記録
items_tags = []
for i in range(20):
  items_tags.append([
      fake.random_int(min=1, max=len(items)),  # 商品ID
      fake.random_int(min=1, max=len(tags)),  # タグID
  ])

# print(items_tags)

# Uniq化
tmp_arr = []
items_tags = [
    x for x in items_tags if x not in tmp_arr and not tmp_arr.append(x)]

df = pd.DataFrame(items_tags, columns=['item_id', 'tag_id'])
display(df)
df.to_csv('sample_csv/items_tags.csv', index=False)
