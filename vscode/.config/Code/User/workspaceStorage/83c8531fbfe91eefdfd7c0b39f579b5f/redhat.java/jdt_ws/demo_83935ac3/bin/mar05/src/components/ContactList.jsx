import React from 'react'
import Contact from './Contact'
import { useState, useEffect } from 'react';
import axios from 'axios';
import ContactForm from './ContactForm';
import EditForm from './EditForm';

export default function ContactList() {
  const [contacts, setContacts] = useState([]);
  const [type, setType] = useState(true);
  const [id, setId] = useState(null);

  useEffect(() => {
    axios.get('http://localhost:4004/contacts')
    .then(res => {
      setContacts(res.data);
    }).catch(err => {
      console.log(err);
    });
  }, [])

  let save = (name, username, email) => {
    console.log("hello")
    const contact = {
      "name" : name, 
      "username" : username,
      "email" : email
    };
    axios.post('http://localhost:4004/contacts', contact)
    .then(res => {
      if(res.status == 201){
        const newContacts = contacts.push(contact);
        setContacts(newContacts);
      }
    })
    .catch(err => {
      console.log(err);
    });
  };

  let del = (id) => {
    axios.delete('http://localhost:4004/contacts/' + id)
    .then(res => {
      const newContacts = contacts.filter(contact => contact.id != id);
      setContacts(newContacts);
    })
    .catch(err => {

    });
  }



  let edit = (contact) => {
    alert("about to edit")
    axios.put('http://localhost:4004/contacts/' + id, contact)
    .then(res => {
      alert(res);
      const newContacts = contact;
      newContacts.forEach(c => {
        if(c.id==id){
          Object.assign(c, contact);
          setType(true);
        }
      })
      setContacts(newContacts);
    })
    .catch(err => {

    });
  }
  
  let makeedit = (contactId) => {
    setType(false);
    setId(contactId);
  }

  return (
    <div className="container">
      <div className="row">
        {
          contacts.map((contact) => (
            <div key={contact.id}>
              <Contact contact={contact} del={del} makeedit={makeedit}></Contact>
            </div>
            )
          )
        }
      </div>
      { type && <ContactForm save={save} ></ContactForm> }
      { !type &&  <EditForm edit={edit} id={id}></EditForm>}
    </div>
  )
}
