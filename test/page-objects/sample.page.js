/* global browser */

'use strict';

const SamplePage = Object.create(this, {
  appButton: { get() { return browser.element('.Index-intro > a'); } },
  appHeader: { get() { return browser.element('.App-header'); } },
  header: { get() { return browser.element('.Index-header > h2'); } },
  productLogo: { get() { return browser.element('.product_logo'); } },
  clickApp: { value() {
    this.appButton.click();
  } },
  getHeaderText: { value() {
    return this.header.getText();
  } },
  getAppHeaderText: { value() {
    return this.appHeader.getText();
  } },
  isProductLogoVisible: { value() {
    return this.productLogo.isVisible();
  } }
});

module.exports = SamplePage;
