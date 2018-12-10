import React from 'react';

import classes from './Input.module.scss';

const input = (props) => {

    let inputElement = null;
    const inputClasses = [classes.input__element];
    const labelClasses = [classes.input__label];

    if (!props.valid && props.touched && props.value !== '') {
        inputClasses.push(classes['input__element--invalid']);
        // labelClasses.push(classes['input__label--invalid']);
    }

    if (props.value !== '') {
        labelClasses.push(classes['input__label--visible']);
    }

    switch (props.elementType) {
        case ('input'):
            inputElement = <input value={props.value} onChange={props.changed} {...props.elementConfig} className={inputClasses.join(' ')}/>;
            break;
        default:
            inputElement = <input />;
    }

    return (
        <div className={classes.input}>
            <label className={labelClasses.join(' ')}>{props.elementConfig.placeholder}</label>
            {inputElement}
        </div>
    );
}

export default input;