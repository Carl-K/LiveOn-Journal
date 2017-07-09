Database Tables:

+-----------------+--------------+------+-----+---------+-------+
| Field           | Type         | Null | Key | Default | Extra |
+-----------------+--------------+------+-----+---------+-------+
| username        | varchar(40)  | NO   | PRI | NULL    |       |
| password_digest | varchar(255) | NO   |     | NULL    |       |
| created_at      | datetime     | NO   |     | NULL    |       |
| updated_at      | datetime     | NO   |     | NULL    |       |
+-----------------+--------------+------+-----+---------+-------+

+------------------------------+--------------+------+-----+---------+----------------+
| Field                        | Type         | Null | Key | Default | Extra          |
+------------------------------+--------------+------+-----+---------+----------------+
| id                           | bigint(20)   | NO   | PRI | NULL    | auto_increment |
| user_identification_username | varchar(255) | NO   | MUL | NULL    |                |
| entry_created_at             | datetime     | NO   |     | NULL    |                |
| entry                        | text         | YES  |     | NULL    |                |
+------------------------------+--------------+------+-----+---------+----------------+
