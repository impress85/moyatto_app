# README

## users テーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| email    | string     | null: false                    |
| password |  string    | null: false                    |
| nickname | string     | null: false                    |

### Association
- has_many :fogs
- has_many :reviews
- has_many :advices

## fogs テーブル
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
- belongs_to :fog

## advices テーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| comment  | text       | null: false                    |
| user     | references | null: false, foreign_key: true |
| fog      | references | null: false, foreign_key: true |

### Association
- has_one :clear
- belongs_to :user
- belongs_to :fog

## clears テーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| fog      | references | null: false, foreign_key: true |
| review   | references | null: false, foreign_key: true |

### Association
- belongs_to :fog
- belongs_to :review