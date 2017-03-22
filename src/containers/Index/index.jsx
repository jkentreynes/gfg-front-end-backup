import React, { PureComponent } from 'react';
import { Link } from 'react-router-dom';

import './index.css';

class Index extends PureComponent {
  render() {
    return (
      <p className="Index-intro">
        To get started, edit <code>src/Index.js</code> and save to reload.
        <Link to="app">App</Link>
      </p>
    );
  }
}

export default Index;
