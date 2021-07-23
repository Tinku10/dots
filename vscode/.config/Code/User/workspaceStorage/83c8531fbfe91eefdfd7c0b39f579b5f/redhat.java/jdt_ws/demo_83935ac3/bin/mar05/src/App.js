import Header from './components/Header'
import Footer from './components/Footer'
import './App.css';
import ContactList from './components/ContactList';
import { BrowserRouter as Router, Switch, Route } from 'react-router-dom';
import AboutUs from './components/AboutUs';
import ContactUs from './components/ContactUs';
import NotFound from './components/NotFound';
import Login from './components/Login';
import PrivateRoute from './components/PrivateRoute';

function App() {
  return (
    <div>
      <Router>
        <Header/>
        <Switch>
          {/* <Route exact path="/" component={ContactList}></Route> */}
          <Route path="/about" component={AboutUs}></Route>
          <Route path="/contact" component={ContactUs}></Route>
          <PrivateRoute exact path="/" component={ContactList}></PrivateRoute>
          <Route path="/login" component={Login}></Route>
          <Route path="*" component={NotFound}></Route>
        </Switch>
        {/* <Footer/> */}
      </Router>
    </div>
  );
}

export default App;
