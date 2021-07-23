import React from 'react'
import { useState, useEffect } from 'react';
import axios from 'axios';

export default function EditForm(props) {

  let edit = props.edit;
  let id = props.id;

  const [name, setName] = useState('');
  const [username, setUsername] = useState('');
  const [email, setEmail] = useState('');

  let handleSubmit = (e) => {
    e.preventDefault();
    const c = {
      name, username, email
    };
    edit(c);
  }


  useEffect(() => {
    axios.get('http://localhost:4004/contacts/' + id)
      .then(res => {
        console.log(res);
        setName(res.data.name);
        setUsername(res.data.username);
        setEmail(res.data.email);
      })
      .catch(err => {
        console.log(err);
      });
  }, [id]);
  
  return (
    <div className="rightpanel">
      <form className="form" onSubmit={(e) => handleSubmit(e)}>
        <div className="mb-3">
          <label  className="form-label">Name</label>
          <input value={name} placeholder={name} onChange={(e) => setName(e.target.value)} type="text" className="form-control" id="exampleInputPassword1"/>
        </div>
        <div className="mb-3">
          <label  className="form-label">Username</label>
          <input value={username} placeholder={username} onChange={(e) => setUsername(e.target.value)}type="text" className="form-control" id="exampleInputPassword1"/>
        </div>
        <div className="mb-3">
          <label  className="form-label">Email</label>
          <input value={email} placeholder={email} onChange={(e) => setEmail(e.target.value)} type="email" className="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"/>
        </div>
        <button className="btn btn-primary">Update</button>
      </form>
    </div>
  )
}
