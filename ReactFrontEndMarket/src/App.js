import  React from 'react';
import { useState } from 'react';
import './App.css';
import { Routes, Route } from "react-router-dom";
import Login from './pages/Login';
import SignUp from './pages/SignUp';
import NoPage from './pages/NoPage';
import Layout from './pages/Layout';
import Home from './pages/Home';
import MyPage from './pages/MyPage';
function App() {
const [currentuser,setCurrentUser] = useState();
const [products,setProducts] = useState();
const [gelenFavori,setgelenFavori] = useState();
const [categories,setCategories] = useState();
const [order,setOrder] = useState();
const[cart,setCart]=  useState();
const[favori,setFavori] = useState()
const[user,setUser] = useState()
const [show, setShow] = useState(false);
const handleClose = () => setShow(false);
const handleShow = () => setShow(true);
const [showf, setShowf] = useState(false);
const handleClosef = () => setShowf(false);
const handleShowf = () => setShowf(true);
console.log(gelenFavori)
  return (
    <div className="App">
      <Routes>
        <Route path="/" element={<Layout handleShow={handleShow} handleShowf={handleShowf} setCurrentUser={setCurrentUser}  currentuser={currentuser} />}>
          <Route path='/home' element={<Home 
          products={products} setProducts={setProducts}
          categories={categories} setCategories={setCategories}
          cart={cart} setCart={setCart}
          favori={favori} setFavori={setFavori}
          user={user} setUser={setUser}
          handleClose={handleClose}  handleClosef={handleClosef} 
          show={show}  showf={showf}
          currentuser={currentuser}
          gelenFavori={gelenFavori} setgelenFavori={setgelenFavori}
          />} />
          <Route index  element={<Login setCurrentUser={setCurrentUser} currentuser={currentuser} order={order} setOrder={setOrder}  />} />
          <Route path="signup" element={<SignUp />} />
          <Route path="mypage" element={<MyPage currentuser={currentuser} setCurrentUser={setCurrentUser} />} />
          <Route path="*" element={<NoPage />} />
        </Route>
      </Routes>
    </div>
  );
}

export default App;
