import React from 'react'
import { Redirect, Route } from 'react-router'

export default function PrivateRoute({component: Component, ...rest}) {
  return (
    <Route render={() => (localStorage.getItem('token')!=null? 
    ( <Component></Component>): (<Redirect to="/login"></Redirect>)
    )} {...rest}></Route>
  )
}
