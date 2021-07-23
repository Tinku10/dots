import axios from 'axios';
import React from 'react'
import { useState } from 'react';
import { useHistory } from 'react-router-dom';

export default function Login() {

  let history = useHistory();
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');

  let handleSubmit = (e) => {
    e.preventDefault();
    history.push('/');
    const c = {username, password};
    axios.post('http://localhost:3000/auth/v1/', c)
    .then(res => {
      localStorage.setItem('token', res.data.token);
      history.push('/');
    })
    .catch(err => {

    });
  }
  return (
    <div className="container">
      <h1 style={{'textAlign': 'center'}}>Login</h1>
      <form className="form" onSubmit={(e) => handleSubmit(e)}>
        <div className="mb-3">
          <label  className="form-label">Username</label>
          <input onChange={(e) => setUsername(e.target.value)}type="text" className="form-control" id="exampleInputPassword1"/>
        </div>
        <div className="mb-3">
          <label  className="form-label">Password</label>
          <input onChange={(e) => setPassword(e.target.value)} type="password" className="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"/>
        </div>
        <input type="submit" className="btn btn-primary" />
      </form>
    </div>
  )
}
