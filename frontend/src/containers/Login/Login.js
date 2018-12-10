import React, { Component } from 'react';

import classes from './Login.module.scss';
import background from '../../assets/images/login.jpg';
import logo from '../../assets/images/logo.png';
import CSSTransition from 'react-transition-group/CSSTransition';

import Input from '../../components/UI/Input/Input';
import Button from '../../components/UI/Button/Button';

import updateObject from '../../shared/updateObject';
import checkFormValidity from '../../shared/checkFormValidity';

class Login extends Component {

    state = {
        login: 'login', //login, register, remind
        formIsValid: false,
        loginForm: {
            email: {
                elementType: 'input',
                elementConfig: {
                    type: 'text',
                    placeholder: 'Email'
                },
                value: '',
                validation: {
                    required: true,
                    isEmail: true
                },
                valid: false,
                touched: false,
            },
            password: {
                elementType: 'input',
                elementConfig: {
                    type: 'password',
                    placeholder: 'Hasło'
                },
                value: '',
                validation: {
                    required: true,
                    minLength: 6,
                    maxLength: 30,
                    isPassword: true
                },
                valid: false,
                touched: false,
            },
            repeatPassword: {
                elementType: 'input',
                elementConfig: {
                    type: 'password',
                    placeholder: 'Powtórz hasło'
                },
                value: '',
                validation: {
                    required: true,
                    minLength: 6,
                    maxLength: 30,
                    isPassword: true,
                    isConfirmPassword: true
                },
                valid: false,
                touched: false,
            }
        }
    }

    //value for each input
    inputChangedHandler = (e, inputId) => {
        const updatedFormElement = updateObject(this.state.loginForm[inputId], {
            value: e.target.value,
            valid: checkFormValidity(e.target.value, this.state.loginForm[inputId].validation, this.state.loginForm.password.value),
            touched: true
        });
        const updatedLoginForm = updateObject(this.state.loginForm, {
            [inputId]: updatedFormElement
        });

        let formIsValid = true;
        for (let inputId in updatedLoginForm) {
            if (this.state.login === 'remind') {
                if (inputId !== 'email') continue;
            } else if (this.state.login === 'login') {
                if (inputId === 'repeatPassword') continue;
            }
            formIsValid = updatedLoginForm[inputId].valid && formIsValid;
        }

        this.setState({ loginForm: updatedLoginForm, formIsValid })
    }

    //toggle login and register
    changeLoginModeHandler = () => {
        let login = this.state.login === 'remind' ? 'login' : this.state.login === 'register' ? 'login' : 'register';
        this.setState({
            login
        });
    }

    //remind password
    remindPasswordHandler = () => {
        this.setState({
            login: 'remind'
        });
    }

    //render login/register/remind inputs and button
    renderLoginInputsHandler = () => {
        let formElements = [];
        let buttonText = 'Zaloguj się';
        let spanText = 'Zaloguj się';
        for (let key in this.state.loginForm) {
            if (this.state.login === 'login') {
                if (key === 'repeatPassword') {
                    continue;
                }
                spanText = 'Zarejestruj się';
            } else if (this.state.login === 'remind') {
                if (key === 'repeatPassword' || key === 'password') {
                    continue;
                }
                buttonText = 'Przypomnij hasło';
            } else {
                buttonText = 'Zarejestruj się';
            }
            formElements.push({
                id: key,
                config: this.state.loginForm[key]
            });
        }
        return {
            buttonText,
            spanText,
            formElements
        }
    }

    //submit login form
    submitLoginFormHandler = (e) => {
        e.preventDefault();
        let info = '';
        let formIsValid = true;
        for (let inputId in this.state.loginForm) {
            if (this.state.login === 'remind') {
                if (inputId !== 'email') continue;
            } else if (this.state.login === 'login') {
                if (inputId === 'repeatPassword') continue;
            }
            formIsValid = this.state.loginForm[inputId].valid && formIsValid;
        }
        if (!formIsValid) {
            info = this.state.login === 'login' ? 'Złe logowanie' : this.state.login === 'register' ? 'Złe  rejestrowanie' : 'Złe przypominanie hasła';
        } else {
            info = this.state.login === 'login' ? 'Logowanie' : this.state.login === 'register' ? 'Rejestrowanie' : 'Przypominanie hasła';
        }
        
        alert (info);
    }

    render() {
        const getLoginInfo = this.renderLoginInputsHandler();
        return (
            <div className={classes.login} style={{backgroundImage: `linear-gradient(to bottom right, #367AB6bb, #AC816Bbb), url(${background})`}}>
                <div className={classes.box}>
                    <div className={classes.box__logo}>
                        <img src={logo} alt="Travel Vibe"/>
                    </div>
                    <form className={classes.box__form} onSubmit={(e) => this.submitLoginFormHandler(e)}>
                        {getLoginInfo.formElements.map((formElement, i) => (
                            <Input
                                key={formElement.id}
                                elementType={formElement.config.elementType}
                                elementConfig={formElement.config.elementConfig}
                                value={formElement.config.value}
                                valid={formElement.config.valid}
                                touched={formElement.config.touched}
                                shouldValidate={formElement.config.validation}
                                changed={(e) => this.inputChangedHandler(e, formElement.id)}/>
                        ))}
                        <Button>{getLoginInfo.buttonText}</Button>
                    </form>
                    <div className={classes.box__footer}>
                        {this.state.login === 'login' ? <span onClick={() => this.remindPasswordHandler()}>Przypomnij hasło</span> : null}
                        <span onClick={() => this.changeLoginModeHandler()}>{getLoginInfo.spanText}</span>
                    </div>
                </div>
            </div>
        );
    }
}

export default Login;