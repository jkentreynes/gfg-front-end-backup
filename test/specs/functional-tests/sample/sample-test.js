'use strict';

const samplePage = require('../../../page-objects/sample.page.js');

describe('Sample Test', () => {
  it('Should be at index page', () => {
    browser.url('/sg');
    expect(samplePage.isProductLogoVisible()).toBe(true);
  });
});
