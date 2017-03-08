'use strict';

var SamplePage = Object.create( this, {
	appButton : { get : function () { return browser.element( '.Index-intro > a' ) } },
	appHeader : { get : function () { return browser.element( '.App-header' ) } },
	header    : { get : function () { return browser.element( '.Index-header > h2' ); } },
	clickApp  : { value : function () {
		this.appButton.click();
	} },
	getHeaderText : { value : function () {
		return this.header.getText();	
	} },
	getAppHeaderText : { value : function () {
		return this.appHeader.getText();
	} }
} );

module.exports = SamplePage;
