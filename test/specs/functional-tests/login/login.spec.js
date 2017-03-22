'use strict';

const loginPage = require( '../../../page-objects/login.page.js' );

describe( 'Login Tests', function() {
	beforeAll( function () {
		browser.url( 'http://localhost:3000/' );
	} );
	describe( 'Loging using valid gmail account', function() {
		describe( 'login', function () {
			it( 'Should register', function() {
				browser.waitForVisible( '.btn-link' );
				browser.click( '.btn-link' );
				browser.setValue( '[ng-reflect-name="firstName"]', 'test' );
				browser.setValue( '[ng-reflect-name="lastName"]', 'test' );
				browser.setValue( '[ng-reflect-name="username"]', 'test' );
				browser.setValue( '[ng-reflect-name="password"]', 'test' );
				browser.click( '.btn' );
			} );

			it( 'Should log the user in', function() {
				console.log( 'execute this ' );
				browser.waitForVisible( '[ng-reflect-router-link="/register"]' );
				loginPage.login( 'test', 'test' );
				console.log( 'executed' );
			} );

			it( 'Should verify login', function() {
				browser.waitForVisible( '[ng-reflect-router-link="/login"]' ); 
				expect( browser.isVisible( '[ng-reflect-router-link="/login"]' ) ).toBe( true );
			} );
		} );
	} );
} );
