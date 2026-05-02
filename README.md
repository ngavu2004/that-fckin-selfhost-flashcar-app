# README

## 1. DB UML diagram
```
+-------------------+
|       Deck        |
+-------------------+
| id : bigint (PK)  |
| name : string     |
| created_at        |
| updated_at        |
+-------------------+
          |
          | 1
          | 
          | has many
          |
          | *
+------------------------+
|         Card           |
+------------------------+
| id : bigint (PK)       |
| deck_id : bigint (FK)  |
| front : text           |
| back : text            |
| confidence : integer   |
| last_reviewed : datetime|
| created_at             |
| updated_at             |
+------------------------+
```

