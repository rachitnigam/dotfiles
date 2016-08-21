/* Copyright 2008, 2010, Oracle and/or its affiliates. All rights reserved.

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; version 2 of the License.

There are special exceptions to the terms and conditions of the GPL
as it is applied to this software. View the full text of the
exception in file EXCEPTIONS-CONNECTOR-C++ in the directory of this
software distribution.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
*/

/* Standard C++ includes */
#include <stdlib.h>
#include <iostream>
#include <cstdlib>

/*
  Include directly the different
  headers from cppconn/ and mysql_driver.h + mysql_util.h
  (and mysql_connection.h). This will reduce your build time!
*/
#include "mysql_connection.h"

#include <cppconn/driver.h>
#include <cppconn/exception.h>
#include <cppconn/resultset.h>
#include <cppconn/statement.h>

using namespace std;

int main(void) {

  if(const char* env_pwd = std::getenv("PWD"))
    if(const char* env_home = std::getenv("HOME")) {
      if(env_pwd != env_home) {
        try {
          sql::Driver *driver;
          sql::Connection *con;
          sql::Statement *stmt;

          /* Create a connection */
          driver = get_driver_instance();
          con = driver->connect("tcp://127.0.0.1:3306", "root", "");
          /* Connect to the MySQL test database */
          con->setSchema("directory");

          stmt = con->createStatement();
          std::string value("INSERT INTO dircounts (path, count) VALUES (");
          value += '\''; 
          value += env_pwd;
          value += '\'';
          value += ", 1) ON DUPLICATE KEY UPDATE count = count + 1";
          stmt->execute(value);

          delete stmt;
          delete con;

        } catch (sql::SQLException &e) {
          cout << "# ERR: SQLException in " << __FILE__;
          cout << "(" << __FUNCTION__ << ") on line " << __LINE__ << endl;
          cout << "# ERR: " << e.what();
          cout << " (MySQL error code: " << e.getErrorCode();
          cout << ", SQLState: " << e.getSQLState() << " )" << endl;
        }
      }
    }
    else {
      std::cout << "Failed to get $HOME";
    }
  else{
    std::cout << "Failed to get $PWD";
  }

  return EXIT_SUCCESS;
}
