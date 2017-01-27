/**
* Copyright (c) Cimbidia.  All rights reserved.
* The use and distribution terms for this software are covered by the
* Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
* which can be found in the file epl-v10.html at the root of this distribution.
* By using this software in any fashion, you are agreeing to be bound by
* the terms of this license.
* You must not remove this notice, or any other, from this software.
**/ 
// General data source properties
dataSource { 	
	pooled = true
	driverClassName = "com.mysql.jdbc.Driver"
	//driverClassName = "com.p6spy.engine.spy.P6SpyDriver" 
	dialect = org.hibernate.dialect.MySQL5InnoDBDialect
	username = "root"
	password = "theficus!234"
    //loggingSql = true
	//format_sql = true
	//use_sql_comments = false
	//show_sql = true
	//logSql = true
    properties {
        maxActive = 10
        maxIdle = 5
        minIdle = 5
        initialSize = 5
        minEvictableIdleTimeMillis = 60000
        timeBetweenEvictionRunsMillis = 60000
        maxWait = 10000
        //validationQuery = "ping"
    }

}

// Hibernate caching properties
hibernate {
    generate_statistics=false
    cache.use_second_level_cache=false
    cache.use_query_cache=false
    cache.provider_class='org.hibernate.cache.EhCacheProvider'
    //default_batch_fetch_size = 16
    //max_fetch_depth = 5
}

// Environment specific settings
environments {
	development {
		dataSource {	
			//dbCreate = "update"
			url = "jdbc:mysql://5.189.157.55:3306/cimbidia?zeroDateTimeBehavior=convertToNull&autoReconnect=true&sessionVariables=storage_engine=InnoDB"
		}
	}
	test {
		dataSource {			
			url = "jdbc:mysql://localhost:3306/cimbidia_test?autoReconnect=true&zeroDateTimeBehavior=convertToNull&sessionVariables=storage_engine=InnoDB"
        }
	}
	loadtest {
		dataSource {			
			url = "jdbc:mysql://localhost:3306/cimbidia_loadtest?autoReconnect=true&zeroDateTimeBehavior=convertToNull&sessionVariables=storage_engine=InnoDB"
        }
	}
	production {
		dataSource {
			url = "jdbc:mysql://localhost:3306/cimbidia?autoReconnect=true&zeroDateTimeBehavior=convertToNull&sessionVariables=storage_engine=InnoDB"
		}
	}
	staging {
		dataSource {
			url = "jdbc:mysql://localhost:3306/cimbidia?autoReconnect=true&zeroDateTimeBehavior=convertToNull&sessionVariables=storage_engine=InnoDB"
		}
	}
	qa {
		dataSource {
			url = "jdbc:mysql://localhost:3306/cimbidia?autoReconnect=true&zeroDateTimeBehavior=convertToNull&sessionVariables=storage_engine=InnoDB"
		}
	}
	diff {
		dataSource {
			url = "jdbc:mysql://localhost:3306/cimbidia_diff?autoReconnect=true&zeroDateTimeBehavior=convertToNull&sessionVariables=storage_engine=InnoDB"
		}
	}
	root {
		dataSource {
			url = "jdbc:mysql://localhost:3306/cimbidia_root?autoReconnect=true&zeroDateTimeBehavior=convertToNull&sessionVariables=storage_engine=InnoDB"
		}
	}
	client {
		dataSource {
			url = "jdbc:mysql://localhost:3306/cimbidia_client?autoReconnect=true&zeroDateTimeBehavior=convertToNull&sessionVariables=storage_engine=InnoDB"
		}
	}
    aws {
        dataSource {
            url = System.getProperty("JDBC_CONNECTION_STRING")
            properties {
                validationQuery = "SELECT 1"
                testOnBorrow = true
                testOnReturn = true
                testWhileIdle = true
                timeBetweenEvictionRunsMillis = 1000 * 60 * 30
                numTestsPerEvictionRun = 3
                minEvictableIdleTimeMillis = 1000 * 60 * 30
            }
        }
    }

}
