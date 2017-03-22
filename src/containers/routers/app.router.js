import React, { PropTypes } from 'react';
import {
  Route,
} from 'react-router-dom';
import { DefaultLayout } from '../../components/Layouts/DefaultLayout';
import Index from '../Index';
import App from '../App';

export const AppRouter = props => (
  <DefaultLayout {...props} >
    <Route exact path={`${props.match.url}`} component={Index} />
    <Route path={`${props.match.url}/app`} component={App} />
  </DefaultLayout>
);

AppRouter.propTypes = {
  match: PropTypes.object
};
