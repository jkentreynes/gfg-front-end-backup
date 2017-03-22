import React from 'react';
import './Header.css';

export const Header = ({ country }) =>
 (
   <div className="navbar">
     <ul className="navbar_l_block">
       <li>
         <a className="navbar_l_block--product_logo" href={`/${country}`}>
          GPE
         </a>
       </li>
       <li className="navbar_l_block--venture_logo">
         <div>
          <img src="ZALORA" alt="ZALORA" />
         </div>
       </li>
       <li className="navbar_l_block--country_toggle" >
         <div src="ZALORA" alt="ZALORA" />
       </li>
     </ul>
   </div>
);
