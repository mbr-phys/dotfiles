!function(e){e.getBackgroundInterface=function(){var e=null;return function(a){return null===e&&(a=a||{},a.source=window,a.direct=!0,e=Interfaces.createInstance(Interfaces.BackgroundInterface,a)),e}}()}(LPPlatform),function(e,a){e.getFavicon=function(e){e.callback&&e.callback(null)},e.once=function(e,a,t){if(e)var n=e(function(){n(),a.apply(t,arguments)})},e.getBigIcons=function(e,a){a=a||"big";var t=a+"icons",n=opendb();if(createDataTable(n),n){var r=function(a,t){e(t.rows.length>0&&null!==t.rows.item(0).data?t.rows.item(0).data:"")};if(g_indexeddb){var i={rows:{item:function(e){return this[e]},length:0}};n.transaction("LastPassData","readonly").objectStore("LastPassData").openCursor(IDBKeyRange.only(db_prepend(g_username_hash)+"_"+t)).onsuccess=function(e){var a=e.target.result;a?(i.rows[i.rows.length]=a.value,i.rows.length++,a.continue()):r(0,i)}}else n.transaction(function(e){e.executeSql("SELECT * FROM LastPassData WHERE username_hash=? AND type=?",[db_prepend(g_username_hash),t],r,function(e,a){console_log(a)})})}},e.saveBigIcons=function(e,a){a=a||"big";var t=a+"icons",n=opendb();createDataTable(n),n&&(g_indexeddb?n.transaction("LastPassData","readwrite").objectStore("LastPassData").put({username_hash:db_prepend(g_username_hash),type:t,data:e,usertype:db_prepend(g_username_hash)+"_"+t}):n.transaction(function(a){a.executeSql("REPLACE INTO LastPassData (username_hash, type, data) VALUES (?, ?, ?)",[db_prepend(g_username_hash),t,e],function(e,a){console_log("server.js : inserted")},function(e,a){console_log(a)})}))},e.updateBigIcons=function(){};var t=function(e,a){for(var t in e){var n=a[t];n&&(n.group=e[t])}};e.refreshGroupNames=function(e){e&&(t(e.sites,g_sites),t(e.notes,g_securenotes),t(e.applications,g_applications))},e.useDialogWindows=function(){return Preferences.get("htmlindialog")},function(){var a={},t=function(e,a){return function(){e.apply(this,arguments),a.apply(this,arguments)}};e.openTabDialog=function(n,r){var i={createAccountSimple:!0,siteTutorial:!0},o=n+(r?"-"+JSON.stringify(r):""),s=a[o];if(s)s.activate();else{var c={dialogWindow:e.useDialogWindows()&&!(r&&r.virtualKeyboard)},l={url:getchromeurl("tabDialog.html?dialog="+n),loadHandler:function(e){e.getTop().LPTabDialog.openDialog(n,r,c),a[o]=e},closeHandler:function(){delete a[o]},tabId:r&&r.tabId?r.tabId:void 0};if(l.tabId)e.navigateTab(l);else if(c.dialogWindow&&!i[n]){var u=Preferences.get("dialogSizePrefs"),f=u[n];l.features={height:f?f.height:600,width:f?f.width:800,left:f?f.left:0,top:f?f.top:0},l.features.width>window.screen.availWidth&&(l.features.width=window.screen.availWidth,l.features.left=0),l.features.height>window.screen.availHeight&&(l.features.height=window.screen.availHeight,l.features.top=0),l.closeHandler=t(l.closeHandler,function(e){u[n]={height:e.outerHeight,width:e.outerWidth,left:e.screenLeft||e.screenX,top:e.screenTop||e.screenY},Preferences.set("dialogSizePrefs",u),delete a[o]}),e.openDialogWindow(l)}else if(i[n])e.openTab(l);else switch(Preferences.get("openpref")){case"tabs":e.openTab(l);break;case"windows":e.openWindow(l);break;case"same":e.openSame(l)}}}}(),e.stringifyFeatures=function(e){var a=[];for(var t in e)a.push(t+"="+e[t]);return a.join(",")},e.doAjax=function(e){LPServer.ajax(e)},e.ajax=function(a){isOffline()?a.error&&a.error(null,null,"offline"):e.doAjax(a)},e.isEdge=function(){return is_edge()},e.copyDataIfEdge=function(a){return e.isEdge()&&void 0!==a?JSON.parse(JSON.stringify(a)):a},e.setUserPreference=function(e){return function(a,t){e(a,t),g_userprefs_changed[a]=t}}(e.setUserPreference),e.setGlobalPreference=function(e){return function(a,t){e(a,t),g_gblprefs_changed[a]=t}}(e.setGlobalPreference),e.writePreferences=function(){lpWriteAllPrefs()},e.closePopovers=function(){},function(){var t={},n={},r={},i={},o={};a.LPTabs={get:function(e){if(e.interface){var a=[];for(var t in i)i[t].tabDetails.interfaceName===e.interface&&a.push(i[t]);return a}if(void 0!==e.tabID){var n=i[e.tabID];if(n)return e.callback&&e.callback(n),n;if(e.callback){var o=r[e.tabID];o||(o=r[e.tabID]=[]),o.push(e.callback)}}}},e.getUnavailablePreferences=function(){return{clearClipboardSecsVal:!can_clear_clipboard(),openpopoverHk:!1,pollServerVal:g_nopoll,storeLostOTP:"0"===g_prefoverrides.account_recovery,showvault:g_hidevault||g_hideshowvault,homeHk:g_hidevault||g_hideshowvault,saveallHk:g_hidesaedhotkey,searchHk:g_hidesearch,usepopupfill:!g_offer_popupfill,recentUsedCount:g_hiderecentlyusedlistsize,searchNotes:g_hidenotes,idleLogoffVal:!(g_is_win||g_is_mac||g_is_linux),enablenamedpipes:lppassusernamehash||!(g_is_win||g_is_mac||g_is_linux)||is_chrome_portable(),enablenewlogin:!0}},e.initializeRequestFramework=function(e){var a=null,s={tabURL:e.tabURL,tabID:e.tabID,windowID:e.windowID},c=LPMessaging.getNewMessageSourceID(),l=!1,u=e.frameIdentity,f=!1,d=function(a){try{var t=!f;return t?(a.frameID=c,e.sendContentScript(a)):t}catch(e){return!1}},g=function(e){return d({type:"backgroundResponse",data:e})},p=function(r){if(a=i[e.tabID],l=r.top,void 0!==s.tabID&&(l&&(n[s.tabID]=c),r.frameIdentity&&(u=s.tabID+"-"+r.frameIdentity)),d({type:"initialization",data:{tabID:s.tabID,frameID:c,topFrameID:n[s.tabID],request:r}}),r.extendFrame){var f=o[u].frameID,g=t[f];t[f]=function(e){d(e),g(e)}}else t[c]=d;if(r.interfaceName&&Interfaces.hasOwnProperty(r.interfaceName)){s.interfaceName||(s.interfaceName=r.interfaceName);var p=function(e){return LPMessaging.makeRequest(d,{type:"contentScriptRequest",sourceFrameID:0,data:e})},b=Interfaces.createInstance(Interfaces[r.interfaceName],{instance:r.extendFrame?o[u].interface:null,direct:!1,context:e.context||"background",requestFunction:p});if(u){var I=o[u];I&&I.frameID!==c&&I.disconnect(),o[u]={interface:b,disconnect:h,frameID:c}}"number"!=typeof s.tabID&&!s.tabID||r.interfaceName!==s.interfaceName||r.extendFrame||(a||(a=i[s.tabID]=new LPTab(s)),a.addFrame(b,{topWindow:l,frameID:c,contentScriptRequester:p,childFrameCount:r.childFrameCount})),e.callback&&e.callback(b)}},b=function(e){switch(e.type){case"backgroundRequest":LPMessaging.handleRequest(Interfaces.BackgroundInterface,e.data,g,{additionalArguments:{tabURL:s.tabURL,tabID:s.tabID,windowID:s.windowID,frameID:c,top:l}});break;case"contentScriptRequest":case"contentScriptResponse":if(0===e.frameID)LPMessaging.handleResponse(e.data);else if(e.frameID){var n=t[e.frameID];n&&n(e)}break;case"initialize":p(e.data);break;case"disconnect":h();break;case"initialized":l&&r[s.tabID]&&(r[s.tabID].forEach(function(e){e(a)}),delete r[s.tabID])}},h=function(){if(!f){f=!0,delete t[c],delete o[u];var a=i[s.tabID];a&&(a.removeFrame(c),a.isEmpty()&&(delete i[s.tabID],delete n[s.tabID])),e.onDisconnect&&e.onDisconnect()}};return{frameID:c,requestHandler:b,disconnectHandler:h}}}()}(LPPlatform,this);