'use strict';

var samplePage = require( '../../page-objects/sample.page.js' );

describe( 'Sample Test', function () {
	it( 'Should click app text button', function () {
		browser.url( '/' );
		samplePage.clickApp();
	} );
} );
