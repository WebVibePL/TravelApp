import React, { Component } from 'react';

import classes from './Login.module.scss';
import background from '../../assets/images/login.jpg';


class Login extends Component {
    render() {
        return (
            <div className={classes.login} style={{backgroundImage: `linear-gradient(to bottom right, #367AB6bb, #AC816Bbb), url(${background})`}}>
                <div className={classes.login__header}>
                <h1>Travel App</h1>
                </div>
                <div className={classes.box}>
                    Login
                </div>
            </div>
        );
    }
}

export default Login;