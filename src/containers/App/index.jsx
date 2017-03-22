import React, { PureComponent } from 'react';
import './App.css';

class App extends PureComponent {
  render() {
    return (
      <div className="App">
          To get started, edit <code>src/App.js</code> and save to reload.
        <div>React env var : {process.env.REACT_APP_TEST} </div>
      </div>
    );
  }
}

export default App;
