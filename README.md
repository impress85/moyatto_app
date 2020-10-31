# README

## users テーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| email    | string     | null: false                    |
| password |  string    | null: false                    |
| nickname | string     | null: false                    |

### Association
- has_many :moyattoes
- has_many :reviews
- has_many :advices

## moyattoes テーブル
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
- has_many :reviews
- belongs_to :user

## reviews テーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| story    | text       | null: false                    |
| result   | text       | null: false                    |
| user     | references | null: false, foreign_key: true |
| fog      | references | null: false, foreign_key: true |

### Association
- has_one :clear
- belongs_to :user
- belongs_to :moyatto

## advices テーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| comment  | text       | null: false                    |
| user     | references | null: false, foreign_key: true |
| fog      | references | null: false, foreign_key: true |

### Association
- has_one :clear
- belongs_to :user
- belongs_to :moyatto

## clears テーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| moyatto  | references | null: false, foreign_key: true |
| review   | references | null: false, foreign_key: true |

### Association
- belongs_to :moyatto
- belongs_to :review