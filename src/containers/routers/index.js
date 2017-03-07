import React from 'react';
import { Router, Route } from 'react-router';
import AppRouter from './app.router';
import Index from '../Index';
import NotFound from '../notfound';

const InitRouter = props => (
  <Router {...props}>
    <Route path="/" component={Index} />
    {AppRouter}
    <Route path="*" component={NotFound} />
  </Router>
);

export default InitRouter;
