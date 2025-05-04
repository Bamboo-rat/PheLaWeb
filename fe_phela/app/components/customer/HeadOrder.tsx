import React from 'react';
import { Link } from 'react-router-dom';
import logo from "../../assets/images/logo.png"; 
import "~/assets/css/head_order.css"

const HeadOrder = () => {
  return (
    <div className="navbar-order">
      <div className="navbar-logo">
        <Link to="/"><img src={logo} alt="Phê La" /></Link>
      </div>
      <div className="navbar-links">
      <Link to="/login-register" className="btn-login">Đăng nhập</Link>
      </div>
    </div>
  );
};

export default HeadOrder;