To deploy Jeti copy the extracted contents to your website, you only have to copy the plugins and emoticons that you want to use. If you changed some plugins or emoticons you should update the plugins.xml and/or the emoticons.xml files. You can do that by hand with a text editor, or by running Jeti as standalone java application (java -jar applet.jar, or double click on the applet.jar file). If you can't run it at you webhost run it localy and copy the xml file to your webhost. You should also add the plugins you use to the applet tag in the html file you use to start Jeti

There are no requirements to your webhost, only the browsers of your users must have at least java 1.4

If you want some advertisment for your applet you can add it to the Jeti applets page: http://jeti.sourceforge.net/mwiki/index.php/Jeti_Sites

The Jeti applet can be configured in different ways to match your requirements, if your changes don't work, you can try to restart your browser or clear the java cache All things that can be changed in the normal Jeti can also be changed in the applet version, just start it as java application as written above. If you want the applet to use automatic language detection open the preferences.xml file and remove the lines <preference key="jeti.country" value="(country ID)"/>
<preference key="spell.defaultLanguage" value="(language)"/>
and upload the preferences.xml file to your webhost

If you want to lock the preferences so the users can't change them you can copy the lines you don't want the users to change to a new file called default.xml and put it in the root jeti directory. The default.xml also has some extra options to remove some menu entries, just add them to that file. The default.xml file should start with <?xml version='1.0'?> <preferences> and end with </preferences> with some <preference key="" value="false"> between.

Extra default.xml options:
Main Jeti menu
<preference key="jeti.jetimenuShowMessage" value="false"/>
<preference key="jeti.jetimenuShowAccount" value="false"/>
<preference key="jeti.jetimenuShowOptions" value="false"/>
<preference key="jeti.jetimenuShowLog" value="false"/>
<preference key="jeti.jetimenuShowAddContact" value="false"/>
<preference key="jeti.jetimenuShowChat" value="false"/>
<preference key="jeti.jetimenuShowExit" value="false"/>
<preference key="jeti.jetimenuShowComment" value="false"/>

Roster menu
<preference key="jeti.rostermenuShowMessage" value="false"/>
<preference key="jeti.rostermenuShowChat" value="false"/>
<preference key="jeti.rostermenuSubscriptions" value="false"/>
<preference key="jeti.rostermenuRemove" value="false"/>
<preference key="jeti.rostermenuRename" value="false"/>
<preference key="jeti.rostermenuGroup" value="false"/>
<preference key="jeti.rostermenuLocalTime" value="false"/>
<preference key="jeti.rostermenuLocalVersion" value="false"/>
<preference key="jeti.rostermenuLastSeen" value="false"/>
<preference key="jeti.rostermenuInvisible" value="false"/>

Change the jid where comments are send to from the comment/bug window <preference key="jeti.commentJID" value="a jid"/>

Hide the servers pane in the Jeti main window
<preference key="jeti.hideServerPanel" value="true"/>

Hide the text error in the servers pane on a error
<preference key="jeti.jetiShowError" value="false"/>

Hide the groupchat Menu in the groupchat window
<preference key="groupchat.hideGroupchatMenu" value="true"/>
Hide the groupchat menu entry in the Jeti menu
<preference key="groupchat.hideGroupchatMenuEntry" value="true"/>
Hide the groupchat status change button
<preference key="groupchat.hideGroupchatStatusButton" value="true"/>
<preference key="groupchat.hideServerChooser" value="true"/>
<preference key="groupchat.defaultGroupchatServer" value="groupchat.server.tld"/>The groupchat server to use
<preference key="groupchat.hideNicknameChooser" value="true"/>

Disable the private chat options in groupchat
<preference key="groupchat.privateMessageingAllowed" value="false"/>

Things to hide in the login window
Hide the whole window
<preference key="jeti.hideLoginWindow" value="true"/>
Hide the server selection box
<preference key="jeti.hideServerSelect" value="true"/>
Hide the port and ssl selection in the login window
<preference key="jeti.hidePortSelect" value="true"/>
Hide the resource input field
<preference key="jeti.hideResourceInput" value="true"/>
Hide the register button
<preference key="jeti.hideRegisterButton" value="true"/>

Anonymous Login
Anonymous login using SASL only works with the xmpp plugin enabled and the server supporting it
<preference key="xmpp.anonymousLogin" value="true"/>
The jabber server basil.cd.chalmers.se supports this, but only allows you to use the groupchats at conference.jabber.cd.chalmers.se. You can also use this server without the XMPP plugin by just login in with any username/password

There are also some options you can set in the applet tag in the jeti.html file (see jetiParams.html for an example)

<PARAM NAME=SERVER VALUE="The jabber server to connect with" >
<PARAM NAME=HOST VALUE="The server to connect with, if it is different then the jabber server" >
<PARAM NAME=PORT VALUE=5223 > The port to connect to
<PARAM NAME=SSL VALUE=true > (Use SSL or not)
<PARAM NAME=USER VALUE="username" > The username
<PARAM NAME=PASSWORD VALUE="password" > The password of the user (for automatic login)
<PARAM NAME=GROUPCHATSERVER VALUE="groupchat.server"> The groupchat server to connect to on load
<PARAM NAME=GROUPCHATROOM VALUE="room" > The groupchat room to connect to on load
<PARAM NAME=GROUPINVITE VALUE="jid1,jid2,jid3" > Invite the specified users users to the room if the applet is started
<PARAM NAME=GROUPCHATROOM2 VALUE="room" > The second groupchat room to connect to on load, only works with SHOWGROUPCHATASMAIN
<PARAM NAME=RESOURCE VALUE=JetiApplet > The resource, when "random" Jeti will choose a random one
<PARAM NAME=CHATTO VALUE="user@server" > open a chat to user on login
<PARAM NAME=SHOWCHATTOASMAIN value="TRUE"> show the chatwindow defined in chatto as main window <PARAM NAME=SHOWGROUPCHATASMAIN VALUE="TRUE"> hide the main Jeti window and show only the groupchat window
<PARAM NAME=HIDELOGINSTATUS VALUE="TRUE" > Hide the login status window
<PARAM NAME=EXITPAGE VALUE="an url" > The url Jeti should go to on exit. Use "javascript:window.close();" as value to close the window on exit
<PARAM NAME=GROUPCHATNICK VALUE="nickname"> The nickname to use in the groupchat on load (otherwise it uses the JID username as nick, or it asks the user if RESOURCE has the value random)
<PARAM NAME=OWNNAME VALUE="nickname"> Your name in the chatwindows

You can also use the jeti preferences in the applet parameters to allow for dynamic per user preferences for example:
<PARAM NAME=DEFAULTPREFERENCES VALUE="jeti.enterSends#false;jeti.menutop#true;jeti.language#it;metaltheme.color1#-3088897; 
