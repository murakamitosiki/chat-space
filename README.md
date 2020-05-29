## users
|Column|Type|Options|
|------|----|-------|
|password|string|null: false, unique true|  　　　　　　　　　　　　　　#integer(数字),string(文字)
|name|string|null:false,unique true|
|email|string|null:folse,unique true|
### Association
has_many : group_teble,through: :groups_users
has_many: message
has_many: group


## groups
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique true|
|member|string|null: false, unique true|
### Association
has_many : users_teble, through: :groups_users
has_many :message
has_many:users

## messages
|Column|Type|Options|
|------|----|-------|
|image|text||
|chat|text||
### Association
belongs_to :users
belongs_to :group



## groups_users
|Column|Type|Options|
|------|----|-------|
|group_id|integer|null:false,foreign_key: true|
|user_id|integer|null:false,foreign_key: true|
### Association
belongs_to :users
belongs_to :group



