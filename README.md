# README

## users テーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| email    | string     | null: false                    |
| password |  string    | null: false                    |
| nickname | string     | null: false                    |

### Association
- has_many :moyattos
- has_many :guesses
- has_many :sukkiris
- has_many :advices

## moyattos テーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| want     | text       | null: false                    |
| cannot   | text       | null: false                    |
| image    | image      | ActiveStorage                  |
| status   | text       | null: false                    |
| user     | references | null: false, foreign_key: true |

### Association
- has_one :clear
- has_many :advices
- has_many :guesses
- belongs_to :user

## guesses テーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| story    | text       | null: false                    |
| user     | references | null: false, foreign_key: true |
| moyatto  | references | null: false, foreign_key: true |

### Association
- has_one :sukkiri
- belongs_to :user
- belongs_to :moyatto

## advices テーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| comment  | text       | null: false                    |
| user     | references | null: false, foreign_key: true |
| moyatto  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :moyatto

## sukkiris テーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| result         | text       | null: false                    |
| moyatto_status | integer    | ActiveHash                     |
| user           | references | null: false, foreign_key: true |
| guess          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :guess


