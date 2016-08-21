# Smart terminal
Make the terminal better by adding a frequency and recency based cd command.

## Installation
0. Install `g++`.
1. Install `mysql` and `mysql-connector-c++`. Both are available on homebrew. For linux, either
build from source or get the library from a package dist.
2. Create a new database called `directory` add a table to it using:
```
CREATE TABLE dircounts
       (path VARCHAR(255) PRIMARY KEY NOT NULL,
        count INT NOT NULL DEFAULT 0,
        time TIMESTAMP NOT NULL)
```
3. In `dircounts.cpp`, `freq.py` and, `recent.py`, change the login credentials to match the ones you use
to log into mysql.
4. Compile `freq.py` and `recent.py` using `python -m py_compile freq.py recent.py`.
5. Compile `dircounts.cpp` using the command:
```
g++ -Wall -I/usr/local/include/cppconn -o testapp test.cpp -L/usr/local/include/mysql/lib -lmysqlcppconn
```
The command assumes that the library was installed using brew. If you used a different source,
compile with proper linking commands for g++.
