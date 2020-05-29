## users
|Column|Type|Options|
|------|----|-------|
|password|string|null: false, unique true|  　　　　　　　　　　　　　　#integer(数字),string(文字)
|name|string|null:false,unique true|
|email|string|null:folse,unique true|
### Association
has_many : groups,through: :groups_users
has_many: messages
has_many :groups_users

## groups
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique true|
### Association
has_many : users, through: :groups_users
has_many :messages
has_many :groups_users


## messages
|Column|Type|Options|
|------|----|-------|
|image|text||
|chat|text||
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|
### Association
belongs_to :user
belongs_to :group



## groups_users
|Column|Type|Options|
|------|----|-------|
|group_id|integer|null:false,foreign_key: true|
|user_id|integer|null:false,foreign_key: true|
### Association
belongs_to :user
belongs_to :group

