/**
* Copyright (c) Cimbidia.  All rights reserved.
* The use and distribution terms for this software are covered by the
* Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
* which can be found in the file epl-v10.html at the root of this distribution.
* By using this software in any fashion, you are agreeing to be bound by
* the terms of this license.
* You must not remove this notice, or any other, from this software.
**/ 
//grails.server.port.http = 8081

grails.project.class.dir = "target/classes"
grails.project.docs.output.dir = "web-app/docs"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir	= "target/test-reports"
//grails.project.war.file = "target/${appName}-${appVersion}.war"

//grails.plugin.location.spock='spock/'

forkConfig = [maxMemory: 1024, minMemory: 64, debug: false, maxPerm: 256]
 grails.project.fork = [
  test: forkConfig, // configure settings for the test-app JVM
  run: forkConfig, // configure settings for the run-app JVM
  war: forkConfig, // configure settings for the run-war JVM
  console: forkConfig // configure settings for the Swing console JVM
 ]

grails.project.dependency.resolver = "maven" // or ivy
grails.project.dependency.resolution = {
	// inherit Grails' default dependencies
	inherits( "global" ) {
		// uncomment to disable ehcache
		 //excludes 'ehcache'
		  excludes ' httpclient'
	}
	log "warn" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
	repositories {
	        //grailsRepo "http://grails.org/plugins"
        grailsPlugins()
		grailsHome()
		grailsCentral()

		mavenLocal()
		mavenCentral()
        //mavenRepo "http://download.java.net/maven/2/"
        mavenRepo "http://repo.grails.org/grails/plugins-releases/"
	}
	
	dependencies {
        build ('org.jboss.tattletale:tattletale-ant:1.2.0.Beta2')  { excludes "ant", "javassist" }
	build("org.tmatesoft.svnkit:svnkit:1.3.5") {
    		excludes "jna", "trilead-ssh2", "sqljet"
	}
	build "org.fusesource.jansi:jansi:1.11"
   
	compile: 'vaadin:7.1.9'
	   
        compile ('org.docx4j:docx4j:2.8.1') { excludes 'commons-logging:commons-logging:1.0.4', 'commons-codec', 'commons-io'}
        compile 'c3p0:c3p0:0.9.1.2'

        //compile 'mysql:mysql-connector-java:5.1.26'
        
        compile 'com.google.zxing:javase:2.0'
        compile ('org.codehaus.groovy.modules.http-builder:http-builder:0.5.2') { excludes "xercesImpl", "groovy",  "commons-lang", "commons-codec" }
        compile 'org.apache.commons:commons-email:1.2'
        build 'org.apache.httpcomponents:httpcore:4.1.2' 
        build 'org.apache.httpcomponents:httpclient:4.1.2' 
        runtime 'org.apache.httpcomponents:httpcore:4.1.2'
        runtime 'org.apache.httpcomponents:httpclient:4.1.2'
        
        compile 'commons-lang:commons-lang:2.6'
		compile 'net.sourceforge.openutils:openutils-log4j:2.0.5'
        compile "org.jadira.usertype:usertype.jodatime:1.9"
	compile "net.sf.ehcache:ehcache-core:2.4.6"
	//compile ":datasources:0.5"
	
        //runtime ":resources:1.2.RC2"
        //runtime ":cached-resources:1.0"
	runtime 'mysql:mysql-connector-java:5.1.18'

	compile 'org.apache.ant:ant:1.8.4'    //you can also use runtime
	compile 'org.apache.ant:ant-launcher:1.8.4'
	
	}
	plugins {
        runtime( ':constraints:0.6.0' )
        runtime( ':jquery-validation:1.9' ) { // 1.7.3
            excludes 'constraints'
        }
        runtime( ':jquery-validation-ui:1.4.7' ) { // 1.1.1
            excludes 'constraints', 'spock'
        }
        /* spock from the grails repo doesn't work with grails 1.3
           we've included our own build of it.
        test(name:'spock', version:'0.6')
        */

        //runtime( ':mail:1.0-SNAPSHOT' ) { excludes 'mail', 'spring-test' }

        runtime( ':excel-import:0.3' ) { excludes 'poi-contrib', 'poi-scratchpad' }
	//runtime(":ehcache-web:2.0.0") {
	// excludes "ehcache-core"
	//}
	
        runtime (':hibernate:3.6.10.7')
		
		runtime ':quartz2:0.2.2'
		//runtime ':quartz:1.0-RC4'
		//compile ':quartz:1.0-RC4'

        test (name:'geb', version:'0.6.3')
	build ":tomcat:7.0.47"
        //compile ":jdbc-pool:7.0.37"		
	compile ":cache:1.1.1"
	
	compile ":scaffolding:2.0.1"
	compile ":rendering:0.4.4"
        compile ":p6spy:0.5"
        compile ":ui-performance:1.2.2"
	compile ":app-info:1.0.3"
	compile ":barcode4j:0.3"
	//compile ":cache-ehcache:1.0.0"
	//compile ":ehcache-web:2.0.0"
	compile ":bubbling:2.1.4"
	compile ":cache-headers:1.1.5"
	compile ":cached-resources:1.0"
	compile ":clickstream:0.2.0"
	//compile ":code-coverage:1.2.5"
	compile ":codenarc:0.17"
	compile ":console:1.1"
	compile ":csv:0.3.1"
	compile ":dynamic-controller:0.3"
	compile ":famfamfam:1.0.1"
	compile ":google-analytics:1.0"
	//compile ":google-visualization:0.5"
	compile ":grails-ui:1.2.3"
	compile ":image-builder:0.2"
	compile ":joda-time:1.4"
	compile ":jquery:1.10.2.2"
	//compile ":jquery-ui:1.8.7"
	compile ":jquery-ui:1.10.3"
	//compile ":liquibase:1.9.3.6"
	   compile(":liquibase:1.9.3.6") { 
	      exclude 'data-source' 
	   } 	
	compile ":pretty-time:0.3"
	compile ":profile-template:0.1"
	runtime ":resources:1.2.1"
	compile ":runtime-logging:0.4"
	//compile ":springcache:1.3.1"
	compile ":template-cache:0.1"
	compile ":ui-performance:1.2.2"
	compile(":webflow:2.0.8.1") {
		exclude 'javassist'
	}
	compile ":yui:2.8.2.1"
	compile ":zipped-resources:1.0"
	plugins {
		runtime ':db-reverse-engineer:0.5'
	 }
	compile ":lookups:1.4"
	//compile ":vaadin:7.1.9"
	//compile ":jdbc-pool:7.0.37"



        //compile ":standalone:1.0"
        //compile ":burning-image:0.5.1"
        //compile ":settings:1.4"
        //compile ":symmetricds:2.4.0"

        //compile ":grails-melody:1.46"
	compile ':jquery-date-time-picker:0.1.0'
	
	/*compile ":applet:0.1"
	compile ":xmpp:0.1"*/
	 
	compile ":twitter-bootstrap:3.1.1"
	//runtime ":lesscss-resources:1.3.3"
	compile ":rabbitmq:1.0.0"
	}
}
