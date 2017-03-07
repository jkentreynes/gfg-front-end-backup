import React, { PureComponent } from 'react';
import { Link } from 'react-router';
import logo from '../imgs/logo.svg';
import './index.css';

class Index extends PureComponent {
  render() {
    return (
      <div className="Index">
        <div className="Index-header">
          <img src={logo} className="Index-logo" alt="logo" />
          <h2>Welcome to React Index</h2>
        </div>
        <p className="Index-intro">
          To get started, edit <code>src/Index.js</code> and save to reload.
          <Link to="/app">App</Link>
        </p>
      </div>
    );
  }
}

export default Index;
