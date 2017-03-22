'use strict';

const LoginPage = Object.create( this, {
	usernameField : { get : function () { return browser.element( '[name="username"]' ); } },
	passwordField : { get : function () { return browser.element( '[name="password"]' ); } },
	loginButton   : { get : function () { return browser.element( '.btn' ); } },
	login         : { value : 
		function ( username, password ) {
			this.usernameField.setValue( username );
			this.passwordField.setValue( password );
			this.loginButton.click();
		} 
	}
} );

module.exports = LoginPage;
