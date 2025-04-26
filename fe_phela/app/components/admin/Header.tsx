import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import "../../assets/css/Header.css";
import logo from "../../assets/images/logo.png";
import menuData from '../../data/menuAdmin.json';
import { FaBars, FaTimes } from "react-icons/fa";

function Header() {
  const [isMenuOpen, setIsMenuOpen] = useState(false);

  const toggleMenu = () => {
    setIsMenuOpen(!isMenuOpen);
  };

  return (
    <div className="nav">
      <div>
        <Link to="/"><img src={logo} className="w-16 h-10 mr-20" alt="Logo" /></Link>
      </div>

      <button className="hamburger-icon ml-auto" onClick={toggleMenu}>
        {isMenuOpen ? <FaTimes/> : <FaBars />}
      </button>

      <div className={`text-white menu-container ${isMenuOpen ? 'open' : ''}`}>
        <ul className="main-menu">
          {menuData.mainMenu.map((menu, index) => (
            <li key={index} className="menu-item group">
              <Link to={menu.link} onClick={() => setIsMenuOpen(false)}>
                {menu.title}
              </Link>
              {menu.subMenu.length > 0 && (
                <ul className="sub-menu">
                  {menu.subMenu.map((subMenu, subIndex) => (
                    <li key={subIndex}>
                      <Link to={subMenu.link} onClick={() => setIsMenuOpen(false)}>{subMenu.title}</Link>
                    </li>
                  ))}
                </ul>
              )}
            </li>
          ))}
        </ul>
      </div>

      <div className="navbar-links ml-7">
        <Link to="/login-register" className="btn-login">Đăng nhập</Link>
      </div>

    </div>
  );
}

export default Header;