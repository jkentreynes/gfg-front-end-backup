import React from 'react';
import {
  BrowserRouter as Router,
  Route,
  Switch
} from 'react-router-dom';
import { AppRouter } from './app.router';
import NotFound from '../Notfound';

const InitRouter = props => (
  <Router {...props}>
    <Switch>
      <Route path="/:country" component={AppRouter} />
      <Route component={NotFound} />
    </Switch>
  </Router>
);

export default InitRouter;
