import React from 'react';
import ReactDOM from 'react-dom';
import { browserHistory } from 'react-router';
// import { createHistory } from 'history';

import InitRouter from './containers/routers';

import './index.css';

// const history = useRouterHistory(createHistory)({
//   basename: '/{}'
// })
ReactDOM.render(
  <InitRouter history={browserHistory} />,
  document.getElementById('root')
);
