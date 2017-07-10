Video demonstration: https://youtu.be/rYoBdBV3UTI

-------------------------------------------------

This is a website I built using Ruby On Rails.  It uses ActiveRecords, ActionViews, ActionControllers, sessions, layouts, partials, BCrypt, MySQL, CSS, and HTML.

Database Tables:

The websites uses 2 database tables: user_identifications and journal_entries.  

user_identifications uses a string titled username as the primary key as opposed to the auto incrementing integer default key id.  It also has a password_digest field for BCrypt.

journal_entries references the user_identifications table through the foreign key user_identifiction_username.

user_identifications:
+-----------------+--------------+------+-----+---------+-------+
| Field           | Type         | Null | Key | Default | Extra |
+-----------------+--------------+------+-----+---------+-------+
| username        | varchar(40)  | NO   | PRI | NULL    |       |
| password_digest | varchar(255) | NO   |     | NULL    |       |
| created_at      | datetime     | NO   |     | NULL    |       |
| updated_at      | datetime     | NO   |     | NULL    |       |
+-----------------+--------------+------+-----+---------+-------+

journal_entries:
+------------------------------+--------------+------+-----+---------+----------------+
| Field                        | Type         | Null | Key | Default | Extra          |
+------------------------------+--------------+------+-----+---------+----------------+
| id                           | bigint(20)   | NO   | PRI | NULL    | auto_increment |
| user_identification_username | varchar(255) | NO   | MUL | NULL    |                |
| entry_created_at             | datetime     | NO   |     | NULL    |                |
| entry                        | text         | YES  |     | NULL    |                |
+------------------------------+--------------+------+-----+---------+----------------+

