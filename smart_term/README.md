#Smarter Terminal

##Pre-requisites
1. Install `mysql`.
2. Install python with `nose` .
3. Install `MySQLdb` from [here](https://sourceforge.net/projects/mysql-python/).

##Setup
1. Create a database with the following table:
  ```sql
		CREATE TABLE dircounts
       (path VARCHAR(255) PRIMARY KEY NOT NULL,
        count INT NOT NULL DEFAULT 0,
        time TIMESTAMP NOT NULL)
  ```
2. Configure the .py files to have the proper login and database information.
3. Run setup.sh.
4. Setup the aliases for the commands.
