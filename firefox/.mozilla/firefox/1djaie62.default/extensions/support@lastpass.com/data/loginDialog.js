var LoginDialog=function(o,t){Dialog.call(this,o,$.extend({additionalHeaderClasses:["icon","leftIcon"],dynamicHeight:!0,responsive:!1,hideHeaderTitle:!0,confirmOnClose:!1,title:Strings.translateString("Log In"),closeButtonEnabled:!0},t))};LoginDialog.prototype=Object.create(Dialog.prototype),LoginDialog.prototype.constructor=LoginDialog,function(){LoginDialog.prototype.initialize=function(o){Dialog.prototype.initialize.apply(this,arguments),function(o,t){o.bind("capsOn",function(o){t.addClass("isCaps")}),o.bind("capsOff",function(o){t.removeClass("isCaps")}),o.capslockstate(),t.addClass(o.capslockstate("state"))}($(window),$(".inputCapsMatter")),function(t){$("#forgotPassword").bind("click",function(){LPPlatform.openURL(LPPlatform.getBaseURL()+"forgot.php"),t.close()}),$("#newToLastPass").bind("click",function(){t.data.isPopup?bg.LPPlatform.openTabDialog("createAccount"):dialogs.createAccount.open(),t.close()}),$("#logInButton").bind("click",function(){t.submit()}),o.find(".showKeyboard").bind("click",function(){t.data.isPopup?(LPPlatform.openKeyboard(),t.close()):t.toggleKeyboard()})}(this)},LoginDialog.prototype.validate=function(o){var t=Dialog.prototype.validate.apply(this,arguments);return""===o.email&&(this.addError("email",Strings.translateString("Please enter your email.")),t=!1),""===o.password&&(this.addError("password",Strings.translateString("Please enter your password.")),t=!1),t}}();