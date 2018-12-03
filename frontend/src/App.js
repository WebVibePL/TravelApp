import React, { Component } from 'react';
import { Route, Switch } from 'react-router-dom';
import './App.scss';

import Login from './containers/Login/Login';

class App extends Component {
    render() {
        return (
            <div className="app">
                <Login />
            </div>
        );
    }
}

export default App;
