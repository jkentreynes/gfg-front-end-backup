import React, { PropTypes } from 'react';
import { Header } from './Header';
import './DefaultLayout.css';

export const DefaultLayout = ({ children, match }) =>
 (
   <div className="page">
     <Header country={match.params.country} />
     {children}
   </div>
);

DefaultLayout.propTypes = {
  children: PropTypes.node.isRequired
};
