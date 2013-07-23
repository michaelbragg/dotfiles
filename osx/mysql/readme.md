# MySQLdb

A small shell script to save time backing up your MySQL database.

## Guide


## Backup Database

Open terminal and enter the commands:

```
$ cd ~/.dotfiles/osx/mysql
$ mysqldb backup
```

This will create a backup of the whole database in your `~/Downloads/` folder.

## Backup Table

Open terminal and enter the commands:

```
$ cd ~/.dotfiles/osx/mysql
$ mysqldb backup table_name
```

This will create a backup of the the chosen table in your `~/Downloads/` folder.