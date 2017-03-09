'use strict';

var testData   = require( './sample-data.json' );
var samplePage = require( '../../../page-objects/sample.page.js' );

describe( 'Sample Test', function () {
	it( 'Should be at index page', function () {
		browser.url( '/' );
		expect( samplePage.getHeaderText() ).toBe( testData.indexHeader );
	} );

	it( 'Should click app text button', function () {
		browser.url( '/' );
		samplePage.clickApp();
	} );

	it( 'Should be at app page', function () {
		browser.url( '/app' );
		expect( samplePage.getAppHeaderText() ).toBe( testData.appHeader );
	} );
} );
