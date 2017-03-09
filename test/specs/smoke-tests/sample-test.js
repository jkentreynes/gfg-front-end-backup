'use strict';

var samplePage = require( '../../page-objects/sample.page.js' );

describe( 'Sample Test', function () {
	it( 'Should click app text button', function () {
		browser.url( '/' );
		samplePage.clickApp();
	} );
	it( 'Should be at app page', function () {
		browser.url( '/app' );
		expect( samplePage.getAppHeaderText() ).toBe( testData.appHeader );
	} );
} );
