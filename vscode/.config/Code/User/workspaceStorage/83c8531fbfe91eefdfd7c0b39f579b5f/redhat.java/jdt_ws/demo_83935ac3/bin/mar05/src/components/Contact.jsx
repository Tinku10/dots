import React from 'react'

export default function Contact(props) {
  const contact = props.contact;
  let del = props.del;
  let makeedit = props.makeedit;

  let handleClick = (id, e) => {
    e.preventDefault();
    makeedit(id);
  }
  return (
    <div className="card" style={{ width: '30vw', padding: '2em', marginBlock: '2em' }}>
      <div className="card-body">
        <h5 className="card-title">{contact.name}</h5>
        <p> {contact.username}</p>
        <p> {contact.email}</p>
        <div className="d-grid gap-2 d-md-flex justify-content-md-end">
          <button type="" onClick={(e) => del(contact.id)} className="btn btn-outline-danger" >Delete</button>
          <button type="" onClick={(e) => { handleClick(contact.id, e) }} className="btn btn-outline-warning gap-2" >Update</button>
        </div>
      </div>
    </div>
  )
}
