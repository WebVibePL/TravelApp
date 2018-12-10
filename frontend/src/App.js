import React, { Component } from 'react';
import { Route, Switch } from 'react-router-dom';

import Login from './containers/Login/Login';
import Dashboard from './containers/Dashboard/Dashboard'; 

class App extends Component {
    render() {
        return (
            <Switch>
                <Route path="/login" component={Login} />
                <Route path="/dashboard" component={Dashboard} />
            </Switch>
        );
    }
}

export default App;
