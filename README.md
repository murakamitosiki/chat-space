## users_teble
|Column|Type|Options|
|------|----|-------|
|password|string|null: false, unique true|  　　　　　　　　　　　　　　#integer(数字),string(文字)
|name|string|null:false,unique true|
|email|string|null:folse,unique true|
### Association
has_many : group_teble,through: :group_users_teble
has_many: message_table
has_many: group_teble


## group_teble
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique true|
|member|string|null: false, unique true|
### Association
has_many : users_teble, through: :group_users_teble
has_many :message_table
has_many:users_teble

## message_table
|Column|Type|Options|
|------|----|-------|
|Photo|text||
|chat|text|null: false,|
### Association
belongs_to :users_teble
belongs_to :group_teble



## group_users_teble
|Column|Type|Options|
|------|----|-------|
|group_id|integer|null:false,foreign_key: true|
|user_id|integer|null:false,foreign_key: true|
### Association
belongs_to :users_teble
belongs_to :group_teble



