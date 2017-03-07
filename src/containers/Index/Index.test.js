import { shallow } from 'enzyme';
import { expect } from 'chai';
import React from 'react';
import ReactDOM from 'react-dom';
import Index from '.';


it('renders without crashing', () => {
  const div = document.createElement('div');
  ReactDOM.render(<Index />, div);
});

it('render and have p have classname call Index-intro', () => {
  const app = shallow(<Index />);
  expect(app.find('.Index-intro')).to.have.length(1);
});
