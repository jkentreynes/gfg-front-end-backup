import { shallow } from 'enzyme';
import { expect } from 'chai';
import React from 'react';
import NofFound from '.';


it('render and have p have classname call Index-intro', () => {
  const app = shallow(<NofFound />);
  expect(app.find('.notfound-page')).to.have.length(1);
});
