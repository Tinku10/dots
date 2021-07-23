import React from 'react'
import { useState } from 'react';

export default function ContactForm(props) {
  const [name, setName] = useState('');
  const [username, setUsername] = useState('');
  const [email, setEmail] = useState('');

  let save = props.save;

  let handleSubmit = (e) => {
    e.preventDefault();
    save(name, username, email);
  }

  return (
    <div className="rightpanel">
      <form className="form" onSubmit={(e) => handleSubmit(e)}>
        <div className="mb-3">
          <label  className="form-label">Name</label>
          <input onChange={(e) => setName(e.target.value)} type="text" className="form-control" id="exampleInputPassword1"/>
        </div>
        <div className="mb-3">
          <label  className="form-label">Username</label>
          <input onChange={(e) => setUsername(e.target.value)}type="text" className="form-control" id="exampleInputPassword1"/>
        </div>
        <div className="mb-3">
          <label  className="form-label">Email</label>
          <input onChange={(e) => setEmail(e.target.value)} type="email" className="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"/>
        </div>
        <input type="submit" className="btn btn-primary" />
      </form>
    </div>
  )
}
