import { shallow } from 'enzyme';
import { expect } from 'chai';
import React from 'react';
import ReactDOM from 'react-dom';
import App from '.';

it('renders without crashing', () => {
  const div = document.createElement('div');
  ReactDOM.render(<App />, div);
});

it('render and have p have classname call App-intro', () => {
  const app = shallow(<App />);
  expect(app.find('.App')).to.have.length(1);
});
