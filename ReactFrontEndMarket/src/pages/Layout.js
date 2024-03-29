import React from 'react'
import { Outlet, Link,useLocation  } from "react-router-dom";
const Layout = ({ handleShow, handleShowf, currentuser,setCurrentUser }) => {

    const location = useLocation();
    const activeurl = `http://localhost:3000${location.pathname}`;
    console.log(`http://localhost:3000${location.pathname}`)
    return (
        <div>
            <div className='row align-items-center container-fluid '  >
                <div className='logo col-2' style={{ height: "50px" }} >
                    <img className='h-100' src='https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Visual_Studio_Code_1.35_icon.svg/2048px-Visual_Studio_Code_1.35_icon.svg.png'></img>
                </div>
                <nav className='col-4'>
                    <ul className='d-flex gap-4 nav nav-underline'>
                        {
                            currentuser && <li className=' list-unstyled nav-item'>
                                <Link className=' text-decoration-none nav-link' to="/home">Shop</Link>
                            </li>
                        }

                     {  !currentuser &&  <li className=' list-unstyled nav-item'>
                            <Link className=' text-decoration-none nav-link' to="/">Login</Link>
                        </li>}
                   {    !currentuser &&  <li className=' list-unstyled nav-item'>
                            <Link className=' text-decoration-none nav-link' to="/signup">SignUp</Link>
                        </li>}
                        {currentuser && <li className=' list-unstyled nav-item'>
                            <Link className=' text-decoration-none nav-link' to="/mypage">MyPage</Link>
                        </li>}
                        {currentuser && <li className=' list-unstyled nav-item'>
                            <Link onClick={()=>{setCurrentUser();sessionStorage.removeItem("currentUser");sessionStorage.removeItem('token');}} className=' text-decoration-none nav-link' to="/">Logout</Link>
                        </li>}
                    </ul>
                </nav>
                <div className='col-2 '>
                    {
                        currentuser && <div className='align-items-center '><span className='fs-2'>Hoşgeldin</span> <span className='fs-2 fw-semibold'>{currentuser.name}</span> </div>
                    }

                </div>
        {    currentuser && activeurl !== "http://localhost:3000/mypage" && <div className='cart-favori col-2 d-flex gap-2'>
                    <div onClick={() => handleShow()} className='btn btn-outline-success justify-content-center d-flex align-items-center gap-2 '>
                        <a className='nav-link '>Cart</a>
                        <i class="fa-solid fa-cart-shopping"></i>
                    </div>
                    <div onClick={() => handleShowf()} className='btn  btn-outline-danger justify-content-center d-flex align-items-center gap-2 '>
                        <a className='nav-link '>Wishlist</a>
                        <i class="fa-solid fa-heart"></i>
                    </div>
                </div>}

            </div>
            <Outlet />
        </div>
    )
}

export default Layout