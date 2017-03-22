import React, { PropTypes } from 'react';
import './Header.css';

export const Header = ({ country }) =>
 (
   <div className="navbar">
     <ul className="navbar_l_block">
       <li>
         <a className="product_logo product_logo--navbar" href={`/${country}`}>
          GPE
         </a>
       </li>
       <li >
         <div className="venture_logo venture_logo--navbar">
           <img src="ZALORA" alt="ZALORA" />
         </div>
       </li>
       <li >
         <div className="country_toggle country_toggle--navbar" >
           
         </div>
       </li>
     </ul>
     <ul className="navbar_r_block">
       <li >
         <div className="country_toggle country_toggle--navbar" />
       </li>
     </ul>
   </div>
);

Header.propTypes = {
  country: PropTypes.string.isRequired
};
