import React, { PureComponent } from 'react';
import logo from '../imgs/logo.svg';
import './App.css';

class App extends PureComponent {
  render() {
    return (
      <div className="App">
        <div className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h2>Welcome to React App Page</h2>
        </div>
        <p className="App-intro">
          To get started, edit <code>src/App.js</code> and save to reload.
        </p>
        <div>React env var : {process.env.REACT_APP_TEST} </div>
      </div>
    );
  }
}

export default App;
