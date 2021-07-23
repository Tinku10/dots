import React from 'react';
import { Link } from 'react-router-dom';

const Header = () => {
    return (
        <div>
            <nav className="navbar">
                <Link className="navtitle" to="/">Contact Manager</Link>
                <ul className="navlinks">
                  <Link className="nav-link active" aria-current="page" to="/">Home</Link>
                  <Link className="nav-link" to="/about">About Us</Link>
                  <Link className="nav-link" to="/contact">Contact Us</Link>
                  <Link className="nav-link" to="/login">Login</Link>
                </ul>
            </nav>
        </div>
    )
}

export default Header;